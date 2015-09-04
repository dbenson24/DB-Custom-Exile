/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Checks to see if players mod pack is up to date, mainly used if small updates are made and aren't absolutely required to join.
*/
if(isNil "ExileClientOlympusModVersion") then {ExileClientOlympusModVersion = 0;};
waitUntil{ExileClientPlayerIsSpawned};
sleep 5;

if(ExileClientOlympusModVersion < olympus_currentModVersion) then {
	hint parseText format["
		<t size='1.2' align='center' color='#005CE6'>New features are now available!</t>
		<br/>
		<br/>
		<t size='1' align='center' color='#66CCFF'>The Olympus mod pack is no longer needed to unlock cars by pressing U. You also only need to enter the pin once.</t>
		<br/>
		<br/>
		<t size='1' align='center' color='#66CCFF'>Hunger and thirst decay rate has now been reduced by 30%.</t>",
		if(ExileClientOlympusModVersion == 0) then {"'Not an Olympus Version'"}else{ExileClientOlympusModVersion},
		olympus_currentModVersion
	];

/*
	hint parseText format["
		<t size='1.2' align='center' color='#FF5050'>@Exile mod is out of date!</t>
		<br/>
		<br/>
		<t size='1' align='center' color='#FFA366'>You may be missing out on bug fixes and additional features!</t>
		<br/>
		<br/>
		<t size='1' align='center' color='#FFA366'>Your version is %1, the latest Olympus version is %2</t>",
		if(ExileClientOlympusModVersion == 0) then {"'Not an Olympus Version'"}else{ExileClientOlympusModVersion},
		olympus_currentModVersion
	];
	
	sleep 15;
	
	hint parseText format["
		<t size='1.2' align='center' color='#005CE6'>This update is NOT required, but highly reccomended.</t>
		<br/>
		<br/>
		<t size='1' align='center' color='#66CCFF'>Download our custom Exile Modpack at www.olympus-entertainment.com/exile</t>
		<br/>
		<br/>
		<t size='1' align='center' color='#66CCFF'>A link to the url is provided in the Server Info of your XM8 Tablet.</t>",
		if(ExileClientOlympusModVersion == 0) then {"'Not an Olympus Version'"}else{ExileClientOlympusModVersion},
		olympus_currentModVersion
	];*/
}else{
	hint parseText format["
		<t size='1.2' align='center' color='#53CF29'>Your mod pack is up to date :)</t>
		<br/>
		<br/>
		<t size='1' align='center' color='#ADCD4D'>Version %1, released on %2</t>",
		ExileClientOlympusModVersion,
		if(ExileClientOlympusModVersion > olympus_currentModVersion) then {"recently"}else{olympus_currentModUpdated}
	];
};