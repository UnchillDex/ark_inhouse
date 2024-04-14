/*
 * Big thanks to @diwako for helping with this, it's a straight nightmare
*/

ark_ai_voices_fnc_selectSound = {
    params ["_unit","_sndType"];

    private _lastLine = _unit getVariable ["ark_ai_voices_var_lastLine", nil];

    private "_voiceLine";
    if (isNil "_lastLine") then {
        switch (_sndType) do {
            case ("suppressed"): {
                _voiceLine = selectRandom ["UnderFireE", "ContactE_1", "ContactE_2", "ContactE_3", "CombatGenericE", "CoverMeE", "moveBack", "EndangeredE"];
            };
            case ("firing"): {
                _voiceLine = selectRandom ["CheeringE", "ContactE_1", "ContactE_2", "ContactE_3", "CombatGenericE", "CoveringE", "moveUp", "SuppressingE"];
            };
            case ("grenade"): {
                _voiceLine = selectRandom ["ThrowingGrenadeE_1", "ThrowingGrenadeE_2", "ThrowingGrenadeE_3"];
            };
            case ("reloading"): {
                _voiceLine = "ReloadingE";
            };
            case ("wakeup"): {
                _voiceLine = "ScreamingE";
            };
        };
    } else {
        switch (_sndType) do {
            case ("suppressed"): {
                private _arr = ["UnderFireE", "ContactE_1", "ContactE_2", "ContactE_3", "CombatGenericE", "CoverMeE", "moveBack", "EndangeredE"];
                _arr deleteAt (_arr find _lastLine);
                _voiceLine = selectRandom _arr;
            };
            case ("firing"): {
                private _arr = ["CheeringE", "ContactE_1", "ContactE_2", "ContactE_3", "CombatGenericE", "CoveringE", "moveUp", "SuppressingE"];
                _arr deleteAt (_arr find _lastLine);
                _voiceLine = selectRandom _arr;
            };
            case ("grenade"): {
                private _arr = ["ThrowingGrenadeE_1", "ThrowingGrenadeE_2", "ThrowingGrenadeE_3"];
                _arr deleteAt (_arr find _lastLine);
                _voiceLine = selectRandom _arr;
            };
            case ("reloading"): {
                _voiceLine = "ReloadingE";
            };
            case ("wakeup"): {
                _voiceLine = "ScreamingE";
            };
        };
    };

    _unit setVariable ["ark_ai_voices_var_lastLine", _voiceLine];

    // Handle muted units, ww2 and sog
    private _speaker = speaker _unit;
    if (toLowerANSI _speaker in ["", "novoice", "ace_novoice", "fow_mute", "vie", "mute"]) exitWith {
        _unit setVariable ["ark_ai_voices_var_disableVoice", true];
    };

    private _speakerVoiceLine = _speaker + _voiceLine;
    private _soundPathArr = ark_ai_voices_namespace get _speakerVoiceLine;

    if (isNil "_soundPathArr") then {
        private _dirPath = (getArray (configFile >> "CfgVoice" >> _speaker >> "directories")) #0;
        if (_dirPath isEqualTo "") exitWith {
            ["AI Voices", "ERROR", "fnc_selectSound", "No directory path for sounds found for", _speaker] call ark_admin_tools_fnc_log;
            _unit setVariable ["ark_ai_voices_var_disableVoice", true];
        };

        private _protocolArr = getArray (configFile >> (getText (configFile >> "CfgVoice" >> _speaker >> "protocol")) >> "Words" >> "Combat" >> _voiceLine);

        // Some mods/DLCS don't have combat words, fallback to "Normal"
        if (_protocolArr isEqualTo []) then {
            _protocolArr = getArray (configFile >> (getText (configFile >> "CfgVoice" >> _speaker >> "protocol")) >> "Words" >> "Normal" >> _voiceLine);
        };

        // If it's still empty, unit has fucked config
        if (_protocolArr isEqualTo []) exitWith {
            ["AI Voices", "ERROR", "fnc_selectSound", "No protocol path sound files available for", [_speaker, _voiceLine]] call ark_admin_tools_fnc_log;
            _unit setVariable ["ark_ai_voices_var_disableVoice", true];
        };

        _soundPathArr = [];
        {
            private _soundPath = _dirPath + _x;
            _soundPathArr pushBack _soundPath;
        } forEach _protocolArr;

        ark_ai_voices_namespace set [_speakerVoiceLine, _soundPathArr];
    };

    if (isNil "_soundPathArr" || { _soundPathArr isEqualTo [] }) exitWith {
        ["AI Voices", "ERROR", "fnc_selectSound", "No sound file to play for unit", _unit] call ark_admin_tools_fnc_log;
        _unit setVariable ["ark_ai_voices_var_disableVoice", true];
    };

    ["ark_ai_voices_ps3d", [_unit, (selectRandom _soundPathArr)]] call CBA_fnc_globalEvent;
};