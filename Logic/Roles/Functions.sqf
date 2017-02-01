// #define	DEBUG		true
#define	DEBUG		false

#define	GET_RA(X)		((X getVariable "dzn_roles_roleId") call dzn_fnc_roles_getRoleAttr)
#define	GET_SQUAD(X)	GET_RA(X) select 0
#define	GET_TEAM(X)		GET_RA(X) select 1
#define	GET_ROLE(X)		GET_RA(X) select 2
#define	GET_N(X)		GET_RA(X) select 3

dzn_fnc_roles_processAssignments = {	
	#define 	NO_UNITS(X)		(X isEqualTo [])
	#define	ALT_SELECT_UNIT(X,Y)	if NO_UNITS(X) then { selectRandom Y } else { selectRandom X }
	
	private _regulars = call dzn_fnc_roles_getRegulars;
	private _newbies = call dzn_fnc_roles_getNewbie;
	
	if (NO_UNITS(_regulars) && NO_UNITS(_newbies)) exitWith { _i = 100; };
	
	if (NO_UNITS(_regulars) && !(NO_UNITS(_newbies))) then { 
		/* Handle no REGULAR slot was used */
		_regulars = [_newbies select 0];
		_newbies = _newbies - [_newbies select 0];
	};
	
	private _allPlayers = _regulars + _newbies;
	
	private _maxRoleNumber = count dzn_roles_list;
	private _roleNumber = count dzn_roles_assignmentTable;
	
	for "_i" from _roleNumber to (_maxRoleNumber - 1) do {
		if NO_UNITS(_allPlayers) exitWith { _i = 100; };
		private _skip = false;
		
		private _roleAttr = _i call dzn_fnc_roles_getRoleAttr; // [1, "RED", "FTL"]
		private _role = _roleAttr select 2;
		private _player = objNull;
		
		if (_role in ["AR","R"]) then {
			_player = ALT_SELECT_UNIT(_newbies,_regulars);	
			PL = _player; RG = _regulars; AP = _allPlayers; I = _i;T = [PL, RG, AP, I];
		} else {
			if NO_UNITS(_regulars) then {
				_skip = true;
				if (_i == (_maxRoleNumber - 1)) exitWith { _i = 100; };
				_i = _i - 1;
				PL = _player; RG = _regulars; AP = _allPlayers; I = _i;T = [PL, RG, AP, I];
			} else {
				_player = selectRandom _regulars;
				PL = _player; RG = _regulars; AP = _allPlayers; I = _i;T = [PL, RG, AP, I];
			};
		};
		
		if (_skip) then {
			if (DEBUG) then {player sideChat format ["Skipped: %1", _roleAttr select 2];};
		} else {			
			_regulars = _regulars - [_player];
			_newbies = _newbies - [_player];
			_allPlayers = _allPlayers - [_player];
			
			if (_player in dzn_roles_assignmentTable && DEBUG) then {
				player sideChat format ["ROLES: Player [%1] for role %2 (%3) already exists in Table with role %4 (%5)"
					,_player
					,_roleAttr
					, _i
					, (_player getVariable "dzn_roles_roleId") call dzn_fnc_roles_getRoleAttr
					, _player getVariable "dzn_roles_roleId"
				];
			};
			
			dzn_roles_assignmentTable pushBack _player;
			_player setVariable ["dzn_roles_roleId", _i, true];
			_player setVariable ["dzn_roles_assigned", true, true];	

			if (_role == "PL") then {
				dzn_roles_pl = _player;
				publicVariable "dzn_roles_pl";		
			};
			
			if (DEBUG) then { 
				_player call dzn_fnc_roles_debug_drawRole; 
				if (_player != player) then { _player call dzn_fnc_roles_assignPlayersRole};
			};
		};
	};
	
	dzn_roles_allAssigned = true;
	publicVariable "dzn_roles_allAssigned";
	publicVariable "dzn_roles_assignmentTable";
};

dzn_fnc_roles_assignPlayersRole = {
	// @Player call dzn_fnc_roles_assignPlayersRole
	private _info = GET_RA(_this);
	
	private _squad = (_info select 0) - 1;
	private _team = _info select 1;
	private _role = _info select 2;
	private _groupPosition = _info select 3;
	
	/*
		KIT
		kit_nato_ftl
	*/
	private _kit = format ["kit_%1_%2", dzn_roles_faction, toLower(_role)];
	[_this, _kit] spawn {
		params["_unit","_kit"];		
		if (_unit != player) exitWith {};
		
		waitUntil { !isNil "dzn_gear_initDone" };
		[_unit, _kit] call dzn_fnc_gear_assignKit;
		
		waitUntil { _unit getVariable ["dzn_gear_done",false] };
		
		waitUntil { !isNil { call TFAR_fnc_activeSwRadio } }; 
		[
			(call TFAR_fnc_activeSwRadio), 
			dzn_roles_swFreq
		] call TFAR_fnc_setSwFrequency;
		
		if (!isNil {call TFAR_fnc_activeLrRadio}) then {
			[
				(call TFAR_fnc_activeLrRadio) select 0
				,(call TFAR_fnc_activeLrRadio) select 1
				,dzn_roles_lrFreq
			] call TFAR_fnc_setLrFrequency;
		};
	};
	
	/*
		Join Group
	*/
	// _this joinAsSilent [dzn_roles_groups select _squad, _groupPosition];
	[_this] joinSilent (dzn_roles_groups select _squad);
	if (toLower(_role) == "sl") then {
		if (!isNil "ace_interaction_fnc_doBecomeLeader") then {
			[_this] call ace_interaction_fnc_doBecomeLeader;
		};
	};
	
	/*
		Join Team
	*/
	if (_team != "") then {
		if (!isNil "ace_interaction_fnc_joinTeam") then {
			[_this, toUpper(_team)] call ace_interaction_fnc_joinTeam;
		} else {
			_this assignTeam toUpper(_team);
		};
	};
	
	/*
		Show Role and ORBAT
	*/
	if (DEBUG) then {hint format ["Squad: %1 \n Team: %2 \n Role: %3 \n Kit: %4", _squad, _team, _role, _kit];};
};


dzn_fnc_roles_getRoleAttr = {
	// [@Squad, @Team, @Role] = @RoleId call dzn_fnc_roles_getRoleAttr
	
	dzn_roles_list select _this
};

dzn_fnc_roles_getRegulars = {
	private _regulars = [
		call BIS_fnc_listPlayers
		, {
			toLower(roleDescription _x) == "regular"
			&& !(_x getVariable ["dzn_roles_assigned", false])
			&& !(_x getVariable ["dzn_roles_processed", false])
		}
	] call BIS_fnc_conditionalSelect;

	if (DEBUG) then {
		_regulars = [
			synchronizedObjects RegularLogic
			, { !(_x getVariable ["dzn_roles_assigned", false]) && !(_x getVariable ["dzn_roles_processed", false]) }
		] call BIS_fnc_conditionalSelect;	
	};
	
	{ _x setVariable ["dzn_roles_processed", true];} forEach _regulars;
	
	_regulars
};

dzn_fnc_roles_getNewbie = {
	private _newbies = [
		call BIS_fnc_listPlayers
		, {
			toLower(roleDescription _x) == "newbie"
			&& !(_x getVariable ["dzn_roles_assigned", false])
			&& !(_x getVariable ["dzn_roles_processed", false])
		}
	] call BIS_fnc_conditionalSelect;
	
	if (DEBUG) then {
		_newbies = [
			synchronizedObjects NewbiesLogic
			, { !(_x getVariable ["dzn_roles_assigned", false]) && !(_x getVariable ["dzn_roles_processed", false]) }
		] call BIS_fnc_conditionalSelect;	
	};

	{ _x setVariable ["dzn_roles_processed", true];} forEach _newbies;
	
	_newbies
};


dzn_fnc_roles_createGroups = {
	for "_i" from 1 to dzn_roles_numberOfGroups do {	
		dzn_roles_groups pushBack (createGroup west);
	};
	
	publicVariable "dzn_roles_groups";
};

dzn_fnc_roles_debug_drawRole = {
	_this setVariable ["tag", _this addAction ["", "", "", 0, false, false, "", "
        if (!alive _target) exitWith {
            _target removeAction (_target getVariable 'tag');
        };
        _dist = (_this distance _target) / 15;
        _color = getArray (configFile/'CfgInGameUI'/'SideColors'/call {
            if (playerSide getFriend side _target < 0.5) then [
                {'colorEnemy'},
                {'colorFriendly'}
            ]
        });
        _color set [3, 1 - _dist];
        drawIcon3D [
            '',
            _color,
            [
                visiblePosition _target select 0,
                visiblePosition _target select 1,
                (visiblePosition _target select 2) + 
                ((_target modelToWorld (
                    _target selectionPosition 'head'
                )) select 2) + 0.4 + _dist / 1.5
            ],
            0,
            0,
            0,
            str((_target  getVariable 'dzn_roles_roleId') call dzn_fnc_roles_getRoleAttr),
            2,
            0.03,
            'PuristaMedium'
        ];
        true
    "]];

};



/*
	Display Functions

*/

dzn_fnc_roles_showMyRole = {
	private _info = GET_RA(player);
	// [1, "RED", "FTL", 1]
	
	private _squad = (_info select 0);
	private _team = _info select 1;
	private _role = _info select 2;
	
	private _roleImg = if (_role in ["SL","PL"]) then {
		format["%1.jpg", _role];
	} else {
		format ["%1_%2.jpg", _team, _role];
	};	

	private _roleName = [dzn_roles_displayNames, _role] call dzn_fnc_getValueByKey;
	private _squadName = [dzn_roles_squadNames, _squad] call dzn_fnc_getValueByKey;
	
	private _assignmentLine = if (_role in ["SL","PL"]) then {
		format ["%1 - %2", _squadName, _roleName];
	} else {
		format ["%1 - %2 - %3", _squadName, _team, _roleName];
	};
	
	[     
		[    
			"<t align='center' size='3'  shadow='1' color='#EDB81A'>Your assignement is</t>"    
			, format ["<t align='center' size='6'><img image='Logic\Roles\img\%1'/></t>",  _roleImg]
			, format ["<t align='center' size='1.7'>%1</t>", _assignmentLine]
		]    
		, [-16,-0.25,140, 0.24]    
		, [0,0,0,1]    
		, dzn_roles_playerRoleScreenShowTime - 1    
	] call dzn_fnc_ShowMessage;
};


dzn_fnc_roles_showORBAT = {	
	private _line_orbat_header = "<t color='#FFFFFF' size='1.5' align='center' font='PuristaBold'>ORBAT</t>";
	private _line_squad_header = "<t color='#FFFFFF' size='1.25' align='center' font='PuristaBold'>1'%1 SQUAD</t>";
	
	private _line_colorPlayer = "#FFFFFF";
	private _line_colorDefault = "#AAAAAA";
	
	private _line_leaders_template = "<t font='PuristaLight'><t color='#EDB81A' size='1.15' align='left'>%1</t><t color='%3' size='1.15' align='right'>%2</t></t>";
	private _line_redTeam = "<t font='PuristaLight'><t color='#E33636' size='1' align='left'>%1</t><t color='%3' size='1' align='right'>%2</t></t>";	
	private _line_blueTeam = "<t font='PuristaLight'><t color='#368DE3' size='1' align='left'>%1</t><t color='%3' size='1' align='right'>%2</t></t>";	
	#define GET_NAME(PAR1)	if (!isNull PAR1 || alive PAR1) then { name PAR1 } else { "N/A" } 
	
	private _compileAndShow = {
		private _orbatLine = "";
		{
			_orbatLine = format ["%1%3%2", _orbatLine,  _x, if (_forEachIndex > 0) then { "<br />" } else { "" }];
		} forEach _this;		
		hint parseText _orbatLine;	
	};
	
	private _orbatHQLines = [_line_orbat_header];
	
	/*
		Squad Leaders
	*/	
	private _SLs = [dzn_roles_assignmentTable, {(GET_RA(_x) select 2) == "SL"}] call BIS_fnc_conditionalSelect;	
	private _SLList = [];
	{
		_SLList set [
			(GET_SQUAD(_x)) - 1
			, format [
				_line_leaders_template
				, "1'" + str(GET_SQUAD(_x)) + " SL"
				, GET_NAME(_x)
				, if (_x == player) then { _line_colorPlayer } else { _line_colorDefault }
			]
		];
	} forEach _SLs;
	_orbatHQLines = _orbatHQLines + _SLList;
	
	/*
		Platoon Leader
	*/	
	if (!isNil "dzn_roles_pl" && { !isNull dzn_roles_pl }) then {
		_orbatHQLines pushBack (
			format [
				_line_leaders_template
				, "1'6 PL"
				, GET_NAME(dzn_roles_pl)
				, if (dzn_roles_pl == player) then { _line_colorPlayer } else { _line_colorDefault }
			]
		);
	};
	
	/*
		My Squad
	*/
	if (GET_ROLE(player) in ["PL"]) exitWith { _orbatHQLines call _compileAndShow };
	private _mySquad = GET_SQUAD(player);	
	_orbatHQLines pushBack "<br />";
	_orbatHQLines pushBack (format [_line_squad_header, _mySquad]);	
	_orbatHQLines pushBack (_SLList select (_mySquad - 1));
	
	private _members = [dzn_roles_assignmentTable, {(GET_SQUAD(_x) == _mySquad) && (GET_ROLE(_x) != "SL")}] call BIS_fnc_conditionalSelect;		
	private _membersList = [];
	{
		_membersList set [
			(GET_N(_x)) -1
			, format [
				if (GET_TEAM(_x) == "RED") then {_line_redTeam} else {_line_blueTeam}
				, [dzn_roles_displayNames, (GET_ROLE(_x))] call dzn_fnc_getValueByKey
				, GET_NAME(_x)
				, if (_x == player) then { _line_colorPlayer } else { _line_colorDefault }
			]		
		];	
	} forEach _members;
	
	_orbatHQLines = _orbatHQLines + _membersList;
	
	/*
		Output
	*/
	
	dzn_roles_OrbatDrawn = true;
	_orbatHQLines call _compileAndShow;	
	[] spawn { sleep 3; dzn_roles_OrbatDrawn = false };
};

