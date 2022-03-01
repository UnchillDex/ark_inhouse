ark_chase_ai_fnc_unitSpawner = {
    [
        {
            params ["", "_id"];
            if (ark_chase_ai_var_spawning isEqualTo false) exitWith {_id call CBA_fnc_removePerFrameHandler};
            if ((count ark_chase_ai_var_unitPool) < ark_chase_ai_var_maxAIUnits) then {
                private _unit = call ark_chase_ai_fnc_createUnit;
                if (isNil "_unit") exitWith {
                    if (missionNamespace getVariable ["ark_chase_ai_var_suppressLog", false]) then {
                        ["Chase AI", "INFO","fnc_unitSpawner","No players available alive or in AO"] call ark_admin_tools_fnc_log;
                        missionNamespace setVariable ["ark_chase_ai_var_suppressLog", true, false];
                    };
                };

                private _nearEnemy = _unit call ark_chase_ai_fnc_nearEnemies;
                if (isNil "_nearEnemy" || { _nearEnemy isEqualTo [] } ) exitWith {
                    if (missionNamespace getVariable ["ark_chase_ai_var_suppressLog", false]) then {
                        ["Chase AI", "INFO","fnc_unitSpawner","Unable to find a near enemy"] call ark_admin_tools_fnc_log;
                        missionNamespace setVariable ["ark_chase_ai_var_suppressLog", true, false];
                    };
                };

                [_unit,_nearEnemy] call ark_chase_ai_fnc_doMove;
                missionNamespace setVariable ["ark_chase_ai_var_suppressLog", false, false];
            };
        },
        ark_chase_ai_var_spawnTime
    ] call CBA_fnc_addPerFrameHandler;
};