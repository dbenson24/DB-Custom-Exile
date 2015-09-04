/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Executed on players when they join
*/
if(!hasInterface || isServer) exitWith {};//fuck off headless clients and server

enableRadio false;
0 fadeRadio 0;

call OlympusClient_fnc_olympusVars;
[] spawn OlympusClient_fnc_intro;
//[] spawn OlympusClient_fnc_checkMod;
[] spawn OlympusClient_fnc_ambientAnim_monitor;
call OlympusClient_fnc_setupMarkers;
call OlympusClient_fnc_setupObjects;