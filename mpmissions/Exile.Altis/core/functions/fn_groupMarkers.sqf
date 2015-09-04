/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Returns an array of icons to be rendered
*/
private["_groupMembers","_groupVehicles","_markerSize"];
_groupMembers = [];
_groupVehicles = [];
{
	if(vehicle _x != _x && !(vehicle _x in _groupVehicles)) then {
		_groupMembers pushBack [getText(configFile/"CfgVehicles"/typeOf (vehicle _x)/"Icon"), [0.1,0.1,0.1,1], getPosWorld (vehicle _x), 0.6, getDir (vehicle _x), ""];
		_groupVehicles pushBack (vehicle _x);
	};
	
	_markerSize = 0.75;
	if(vehicle _x in _groupVehicles) then {
		_markerSize = 0;
	};
	
	if(alive _x) then {
		_groupMembers pushBack [((call olympus_currMissionDir) + "images\icons\Player.paa"), [1,1,1,1], getPosWorld _x, _markerSize, getDir _x, format["%1", _x getVariable["ExileName", name _x]]];
	}else{
		_groupMembers pushBack [((call olympus_currMissionDir) + "images\icons\Rip.paa"), [1,1,1,1], getPosWorld _x, _markerSize, 0, format["%1", _x getVariable["ExileName", name _x]]];
	};
}forEach (units(group player));
_groupMembers;