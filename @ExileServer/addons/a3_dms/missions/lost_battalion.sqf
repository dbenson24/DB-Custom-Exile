/*
	Sample mission
	Created by Defent and eraser1

	Called from DMS_selectMission
*/

private ["_num", "_side", "_pos", "_difficulty", "_AICount", "_group", "_crate", "_crate2", "_crate_loot_values", "_msgStart", "_msgWIN", "_msgLOSE", "_missionName", "_missionAIUnits", "_missionObjs", "_markers", "_time", "_added"];

// For logging purposes
_num = DMS_MissionCount;


// Set mission side (only "bandit" is supported for now)
_side = "bandit";


// find position
_pos = [10,100] call DMS_findSafePos;


// Set general mission difficulty
_difficulty = "hardcore";


// Create AI
// TODO: Spawn AI only when players are nearby
_AICount = 6 + (round (random 2));

_group =
[
	_pos,					// Position of AI
	_AICount,				// Number of AI
	"random",				// "random","hardcore","difficult","moderate", or "easy"
	"random", 				// "random","assault","MG","sniper" or "unarmed" OR [_type,_launcher]
	_side 					// "bandit","hero", etc.
] call DMS_SpawnAIGroup;


// Create Crate
_crate = ["Box_NATO_Wps_F",_pos] call DMS_SpawnCrate;
_crate2 = ["Box_NATO_Wps_F",_pos] call DMS_SpawnCrate;

// Set crate loot values
_crate_loot_values =
[
	7,		// Weapons
	5,		// Items
	5 		// Backpacks
];


// Define mission-spawned AI Units
_missionAIUnits =
[
	_group 		// We only spawned the single group for this mission
];

// Define mission-spawned objects and loot values
_missionObjs =
[
	[],			// No spawned buildings
	[_crate,_crate2],
	_crate_loot_values
];

// Define Mission Start message
_msgStart = format["A battalion of soldiers have gotten lost in convict land! Eliminate them!"];

// Define Mission Win message
_msgWIN = format["Convicts have successfully eliminated the lost battalion!"];

// Define Mission Lose message
_msgLOSE = format["Whittlesey escaped with his Lost Battalion!"];


// Define mission name (for map marker and logging)
_missionName = "Lost Battalion";

// Create Markers
_markers =
[
	_pos,
	_missionName,
	_difficulty
] call DMS_CreateMarker;

// Record time here (for logging purposes, otherwise you could just put "diag_tickTime" into the "DMS_AddMissionToMonitor" parameters directly)
_time = diag_tickTime;

// Parse and add mission info to missions monitor
_added =
[
	_pos,
	[
		[
			"kill",
			_group
		],
		[
			"playerNear",
			[_pos,DMS_playerNearRadius]
		]
	],
	[
		_time,
		(DMS_MissionTimeOut select 0) + random((DMS_MissionTimeOut select 1) - (DMS_MissionTimeOut select 0))
	],
	_missionAIUnits,
	_missionObjs,
	[_msgWIN,_msgLOSE],
	_markers,
	_side
] call DMS_AddMissionToMonitor;

// Check to see if it was added correctly, otherwise delete the stuff
if !(_added) exitWith
{
	diag_log format ["DMS ERROR :: Attempt to set up mission %1 with invalid parameters for DMS_AddMissionToMonitor! Deleting mission objects and resetting DMS_MissionCount.",_missionName];

	// Delete AI units and the crate. I could do it in one line but I just made a little function that should work for every mission (provided you defined everything correctly)
	_cleanup = [];
	{
		_cleanup pushBack _x;
		false;
	} count _missionAIUnits;

	_cleanup pushBack ((_missionObjs select 0)+(_missionObjs select 1));

	_cleanup call DMS_CleanUp;


	// Delete the markers directly
	{deleteMarker _x;false;} count _markers;


	// Reset the mission count
	DMS_MissionCount = DMS_MissionCount - 1;
};


// Notify players
_msgStart call DMS_BroadcastMissionStatus;



if (DMS_DEBUG) then
{
	diag_log format ["DMS_DEBUG MISSION: (%1) :: Mission #%2 started at %3 with %4 AI units and %5 difficulty at time %6",_missionName,_num,_pos,_AICount,_difficulty,_time];
};