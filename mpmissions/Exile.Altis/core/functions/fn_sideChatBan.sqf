/*
	Author: Poseidon
	Copyright 2015 Olympus Entertainment
	This file is not to be used outside of Olympus servers.
	
	Description: Prevents shitty users from typing in side chat, fucking making the chat cancerous, jeezus these people are the worst.
*/
waitUntil {!isNil "olympus_sideChatBans";};

while{true} do {
	waitUntil{(getPlayerUID player) in olympus_sideChatBans};
	
	hint parseText format["
		<t size='1.2' align='center' color='#FF0000'>You're banned from typing in side chat!</t>
		<br/>
		<br/>
		<t size='1' align='center' color='#DB4D4D'>Congrats, you suck!</t>
		<br/>
		<br/>
		<t size='1' align='center' color='#DB4D4D'>If you've decided to be less cancerous you can submit a ban appeal.</t>"
	];
	
	while{true} do {
		waitUntil{currentChannel == 1 || currentChannel == 0};
		
		if!((getPlayerUID player) in olympus_sideChatBans) exitWith {};//theyve been unbanned, go back to monitoring
		
		titleText ["No side chat for you, scrublord.", "PLAIN"];
		setCurrentChannel 3;//thank jeezus bohemia added this in april
	};
};