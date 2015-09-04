/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Called on each frame when viewing gps/map to render markers
*/
private["_refreshTime","_size"];
_refreshTime = 0.2;

if(time > olympus_MapLastRefresh) then {
	olympus_MapDynamicIcons = [];
	olympus_MapDynamicIcons = call OlympusClient_fnc_groupMarkers;
	olympus_MapLastRefresh = time + _refreshTime;
};

{
	_size = (_x select 3) * (0.5 / ctrlMapScale (_this select 0));
	if((_x select 3) > 0.2 && _size < 22) then {_size = 22;};
	
	if(!visibleMap) then {
		if(_x select 2 distance player < 800) then {
			_this select 0 drawIcon [
				_x select 0,
				_x select 1,
				_x select 2,
				_size,
				_size,
				_x select 4,
				_x select 5,
				1,
				0.03,
				'TahomaB',
				'right'
			];
		};
	}else{
		_this select 0 drawIcon [
			_x select 0,
			_x select 1,
			_x select 2,
			_size,
			_size,
			_x select 4,
			_x select 5,
			1,
			0.06,
			'TahomaB',
			'right'
		];
	};
}foreach olympus_MapDynamicIcons;
true