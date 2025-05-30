#include "..\script_component.hpp"
/*
 * Author: Cyruz
 * Unsure
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ark_deploy_fnc_waterDeploy
 */

params ["_unit", "_position"];

_unit setVariable ["ark_deploy_canDeploy", false, true];
onMapSingleClick "";

private _underSurface = (abs (getTerrainHeightASL _position)) / 2;
private _aliveUnits = [];

{
    if (alive _x) then {
        _aliveUnits pushBack _x;
    };
} forEach units (group _unit);

{
    _x setPosWorld (_x modelToWorldWorld [0,0,0]);
    [{(_this #0) setPosASL [(_this #1),(_this #2),-(_this #3)]}, [_x, _position #0, _position #1, _underSurface]] call CBA_fnc_execNextFrame;
} forEach _aliveUnits;

openMap [false, false];
