/*
 *	You can change MissionDate to some specific date to override date set in mission editor:
 *		format:		[@Year, @Month, @Day, @Hours, @Minutes] (e.g. [2012, 12, 31, 12, 45])
 */
 
MissionDate = [
	date select 0
	, date select 1
	, date select 2
	, if ("par_daytime" call BIS_fnc_getParamValue == 0) then {10+round(random 4)} else {21+round(random 8)}
	, selectRandom [0,10,15,20,25,30,40,45,50]
];
publicVariable "MissionDate";

/*
 * Date
 */
setDate MissionDate;

/*
 *	Weather
 */
if (!isNil "dzn_fnc_setWeather") then {
	  ("par_weather" call BIS_fnc_getParamValue) spawn dzn_fnc_setWeather;
};


/*
 * Logics
 */


if !(hasInterface) then {
	[] execVM "Logic\Roles\Init.sqf";
	[] execVM "Logic\Tasks\Init.sqf";	
};

[] execVM "Logic\Hostiles\Init.sqf";

EndGameTimerLimit = ("par_endgametimer" call BIS_fnc_getParamValue)*60;
EndGameTimer = EndGameTimerLimit;

publicVariable "EndGameTimerLimit";
publicVariable "EndGameTimer";

[] spawn {
	for "_i" from 0 to EndGameTimerLimit do {
		sleep 1;
		EndGameTimer = EndGameTimer - 1;
		publicVariable "EndGameTimer";
	};
};

