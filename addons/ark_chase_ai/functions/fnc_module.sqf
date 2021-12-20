ark_chase_ai_module_preinit = {
    params ["_logic", "", "_activated"];

    if (_activated) then {
        if (_logic getVariable ["ark_chase_ai_var_moduleRan", false]) exitWith {
            [COMPONENT_BEAUTIFIED, "ERROR","fnc_module","Module tried to execute multiple times",_logic] call ark_admin_tools_fnc_log;
        };

        _logic setVariable ["ark_chase_ai_var_moduleRan", _activated];
        [_logic] call ark_chase_ai_fnc_init;
    } else {
        [COMPONENT_BEAUTIFIED, "ERROR","fnc_module","Module not activated - Disabling"] call ark_admin_tools_fnc_log;
    };
};