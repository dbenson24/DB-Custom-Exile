/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Displays the intro to the server and checks mod pack after.
*/
private["_duration","_introArray"];
waitUntil{ExileClientPlayerIsSpawned};
sleep 5;

call OlympusClient_fnc_sideChatBan;

_duration = 2.8;
_introArray = [
	[
		"Welcome to Exile",
		["Hosted by Olympus Entertainment"]
	],[
		"Automatic Server Restarts",
		[format["Occur every 3 hours, the next on is in %1 minutes", ((10800 - serverTime) / 60)]]
	],[
		"Olympus Developers",
		["Poseidon", "Odin", "Gucci Mane"]
	],[
		"Olympus Designers",
		["Muthinator"]
	],[
		"Administrators",
		["Ace","Grandma Gary","Odin","Travis"]
	],[
		"Moderators",
		["D3V1L","HamOfMoose","Ksay","Pinkstreak","Theseus","Tman15tmb"]
	],[
		"For more information",
		["Please read Server Info in your XM8 tablet"]
	]
];


{
	sleep _duration;
	_introText = format["<t size='0.55' color='#a6f20b' align='right'>%1<br/></t><t size='0.70' color='#FFFFFF' align='right'>", _x select 0];
	{
		_introText = _introText + format["%1<br/>", _x]
	}forEach (_x select 1);
	_introText = _introText + "</t>";
	_duration + (((count (_x select 1)) - 1) * 0.8);
	
	[
		_introText,
		[safezoneX + safezoneW - 0.5,0.35],
		[safezoneY + safezoneH - 0.8,0.7],
		_duration,
		0.5
	] spawn BIS_fnc_dynamicText;
	
	sleep _duration;
}foreach _introArray;
