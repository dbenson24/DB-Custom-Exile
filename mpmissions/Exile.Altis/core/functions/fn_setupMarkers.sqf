/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Sets up handlers for dynamic map markers
*/
[] spawn {
	private ["_display", "_mapCtrl"];

	disableSerialization;
	waitUntil {_display = findDisplay 12; !isNull _display};
	_mapCtrl = _display displayCtrl 51;

	_mapCtrl ctrlAddEventHandler ["Draw", OlympusClient_fnc_drawMarkers];
};

[] spawn {
	private ["_display", "_mapCtrl"];

	disableSerialization;
	waitUntil {_display = uiNamespace getVariable ["RscMiniMap", displayNull]; !isNull _display};
	_mapCtrl = _display displayCtrl 101;
	
	_mapCtrl ctrlAddEventHandler ["Draw", OlympusClient_fnc_drawMarkers];
};
true