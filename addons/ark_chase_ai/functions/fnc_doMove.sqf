ark_chase_ai_fnc_doMove = {
    params ["_unit","_target"];

    [
        {
            params ["_args", "_id"];
            _args params ["_unit","_target"];
            if (isNil "_unit" || { !alive _unit } || { _unit getVariable ["ark_admin_tools_fnc_chaseAI_hunting", false] }) exitWith {
                _id call CBA_fnc_removePerFrameHandler;
            };

            if (!alive _target) then {
                _target = _unit call ark_chase_ai_fnc_nearEnemies;
            };

            if (isNil "_target" || { _target isEqualTo [] } ) exitWith {
                deleteVehicle _unit;
            };

            private "_targetPos";
            if ([_target] call ace_common_fnc_isInBuilding || { ark_chase_ai_var_wpAccuracy isEqualTo 0 }) then {
                _targetPos = getPosATL _target;
            } else {
                _targetPos = _target getPos [ark_chase_ai_var_wpAccuracy, random 360];
            };

            if (_unit distance2D _targetPos < (ark_chase_ai_var_maxDistance + 50)) then {
                _unit setDestination [_targetPos, "LEADER PLANNED", true];
                _unit doMove _targetPos;
            } else {
                private _pos = call ark_chase_ai_fnc_findSpawnPos;
                if (isNil "_pos" || { _pos isEqualTo [] }) exitWith {
                    deleteVehicle _unit;
                };
                _unit setPosASL _pos;
            };
        },
        15,
        [_unit,_target]
    ] call CBA_fnc_addPerFrameHandler;
};