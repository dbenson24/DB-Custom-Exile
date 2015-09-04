/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Spawns a local vehicle and executes code on them
*/
private["_objects"];
_objects = [];

{
	_objects = _objects + [_x] call OlympusClient_fnc_localObjects;
}foreach ["Altis"];

{
	_x spawn OlympusClient_fnc_createVehicleLocal;
}foreach _objects;

[] spawn {
	while{true} do {
		if(vehicle player == player) then {
			_loot = nearestObjects[(getPos player),["GroundWeaponHolder"],25];
			{
				_x enableSimulation true;
			}foreach _loot;
			sleep 5;
		};
		sleep 2.5;
	};
};

true