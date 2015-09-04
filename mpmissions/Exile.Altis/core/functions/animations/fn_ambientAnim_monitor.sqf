/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Does stuff
*/
private["_nearUnits"];
olympus_npcAnimations = !olympus_npcAnimations;//turn em on, or off if called again

while{olympus_npcAnimations} do {
	_nearUnits = ((position player) nearEntities ["Man",45]);
	
	{
		if(!isPlayer _x) then {
			if(!(_x in olympus_animatedNpcs)) then {
				if(_x getVariable ["BIS_fnc_ambientAnim__time",-1] != -1) then {		
					(attachedTo _x) enableSimulation true;
					olympus_animatedNpcs pushBack _x;
				};
			};
		};
	}foreach _nearUnits;
	
	{
		if(!(_x in _nearUnits)) then {
			(attachedTo _x) enableSimulation false;
			olympus_animatedNpcs = olympus_animatedNpcs - [_x];
		};
	}foreach olympus_animatedNpcs;

	sleep 2;
	
	if(!olympus_npcAnimations) then {
		if(count olympus_animatedNpcs < 0) then {
			{
				(attachedTo _x) enableSimulation false;
			}foreach olympus_animatedNpcs;
		};
	};
};