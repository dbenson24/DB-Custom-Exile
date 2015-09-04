/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Declares variables used mission side
*/
olympus_npcAnimations = false;
olympus_animatedNpcs = [];
olympus_currentModVersion = 1.02;
olympus_currentModUpdated = "August 24 2015";
olympus_MapLastRefresh = time;
olympus_MapDynamicIcons = [];
ExileClientRememberVehiclePin = [objNull, "00000"];
olympus_currMissionDir = compileFinal str ((str missionConfigFile) select [0, count (str missionConfigFile) - 15]);

olympus_animAttachConfig = {
	switch (_this) do {
		case "SIT_AT_TABLE":{
			[
				["Land_CampingChair_V2_F",[0,0.08,-0.02],-180],
				["Land_ChairPlastic_F",[0,0.08,0.02],90],
				["Land_ChairWood_F",[0,0.02,-0.02],-180],
				["Land_RattanChair_01_F",[0,0.06,0.05],-180],
				["Land_OfficeChair_01_F",[0,-0.08,0.12],-180]
			];
		};
		case "SIT";
		case "SIT1";
		case "SIT2";
		case "SIT3";
		case "SIT_U1";
		case "SIT_U2";
		case "SIT_U3":{
			[
				["Land_CampingChair_V2_F",[0,0.08,0.05],-180],
				["Land_ChairPlastic_F",[0,0.08,0.05],90],
				["Land_ChairWood_F",[0,0.02,0.05],-180],
				["Land_RattanChair_01_F",[0,0.06,0.05],-180],
				["Land_OfficeChair_01_F",[0,-0.08,0.12],-180]	
			];
		};

		case "SIT_SAD1":{
			[
				["Box_NATO_Wps_F",[0,-0.27,0.03],0]
			];
		};
		
		case "SIT_SAD2":{
			[
				["Box_NATO_Wps_F",[0,-0.3,0.05],0]
			];
		};
		
		case "SIT_HIGH1":{
			[
				["Box_NATO_Wps_F",[0,-0.23,0.03],0],
				["Land_CashDesk_F",[-0.365,0.1,0.375],180]
			];
		};
		
		case "SIT_HIGH";
		case "SIT_HIGH2": {
			[
				["Box_NATO_Wps_F",[0,-0.12,-0.20],0],
				["Land_PaperBox_open_full_F",[0.2,0.35,0.30],180]
			];
		};
		
		case "LEAN_ON_TABLE": {
			[
				["Land_CashDesk_F",[0.365,-0.55,0.2],180],
				["Land_WoodenTable_large_F",[0,-1,0.04],270]
			];
		};


		default {
			[];
		};
	};
};
true