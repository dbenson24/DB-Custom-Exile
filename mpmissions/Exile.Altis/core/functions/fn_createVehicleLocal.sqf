/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Spawns a local vehicle and executes code on them
*/
private["_className","_position","_direction","_localVehicle"];
_className = _this param [0,"",[""]];
_position = _this param [1,[],[[]]];
_direction = _this param [2,-9999,[0]];
_code = _this param [3,"",[""]];

if(_className == "" || _position isEqualTo [] || _direction == -9999) exitWith {};

_localVehicle = _className createVehicleLocal [0,0,0];
waitUntil{!isNull _localVehicle};
_localVehicle enableSimulation false;
_localVehicle allowDamage false;
_localVehicle setPosATL _position;
sleep 0.01;
_localVehicle setPosATL _position;
sleep 0.01;
_localVehicle setDir _direction;

if(_code != "") then {
	_localVehicle call compile _code;
};