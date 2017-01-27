call compile preprocessFileLineNumbers "Logic\Notifications\Settings.sqf";
call compile preprocessFileLineNumbers "Logic\Notifications\Functions.sqf";

if !(hasInterface) exitWith {};

waitUntil { time > 3 && !isNil "EndGameTimer" && !isNil "EndGameTimerLimit"};

// call dzn_fnc_notif_addORBATTopic;
// call dzn_fnc_notif_addTimeTopics;

[] spawn dzn_fnc_notif_runTimeNotifHandler;
[] spawn dzn_fnc_notif_runCaptureNotifHandler;


/* Hotkeys */
waitUntil { !(isNull (findDisplay 46)) }; 
dzn_roles_keyIsDown = false;
(findDisplay 46) displayAddEventHandler ["KeyDown", "_handled = _this call dzn_fnc_roles_onKeyPress"];