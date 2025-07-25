#include "script_component.hpp"

ark_aiDebugEnabled = false;

if (hasInterface) then {
    // Chat Commands
    ["endmission", {
        //[QGVAR(endMission), ["end1"]] call CBA_fnc_globalEvent;
        [QGVAR(endMission), ["EveryoneWon"]] call CBA_fnc_serverEvent;
    }, "adminLogged"] call CBA_fnc_registerChatCommand;

    ["failmission", {
        //[QGVAR(endMission), ["loser", false]] call CBA_fnc_globalEvent;
        [QGVAR(endMission), ["EveryoneLost"]] call CBA_fnc_serverEvent;
    }, "adminLogged"] call CBA_fnc_registerChatCommand;

    ["boogie", {
        if (isNull objectParent player) then {
            private _dance = selectRandom [["Acts_Dance_01", 25],["Acts_Dance_02",21]];
            [player, _dance #0, 2] call ace_common_fnc_doAnimation;
            [{
                [player, "", 2] call ace_common_fnc_doAnimation;
            }, [], _dance #1] call CBA_fnc_waitAndExecute;
        } else {
            [["\A3\ui_f\data\igui\cfg\simpleTasks\types\wait_ca.paa", 2.0], ["No dancing allowed zone!"]] call CBA_fnc_notify;
        };
    }, "all"] call CBA_fnc_registerChatCommand;

    ["roll", {
        private _roll = ceil (random 20);
        private _txt = format ["%1 rolled: %2", (name player), _roll];
        [["a3\ui_f_curator\data\cfgmpgametypes\zgm_ca.paa", 2.0], [_txt], true] call CBA_fnc_notify;
        [QGVAR(rollMessage), [_txt]] call CBA_fnc_globalEvent;
    }, "all"] call CBA_fnc_registerChatCommand;
};

// Server only function events
if (isServer) then {
    [QGVAR(callReinforcementsEvent), {_this call FUNC(callReinforcements)}] call CBA_fnc_addEventHandler;
};

// Global events
[QGVAR(endMission), {
    params ["_endType", ["_isVictory", true]];

    //[_endType, _isVictory] call BIS_fnc_endMission;
    _endType call BIS_fnc_endMissionServer;
}] call CBA_fnc_addEventHandler;

[QGVAR(rollMessage), {
    params ["_message"];
    systemChat _message;
}] call CBA_fnc_addEventHandler;
