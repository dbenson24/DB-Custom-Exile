/**
 * Exile Mod
 * www.exilemod.com
 * Copyright 2015 Exile Mod Team
 * Modified by: Poseidon for Olympus Entertainment
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_message","_mode","_object"];
_message = _this select 0;
_mode = _this select 1;
_object = _this select 2;
if(_mode)then
{
	["Success", [_message]] call BIS_fnc_showNotification;
	if(_object == (ExileClientRememberVehiclePin select 0)) then {
		_object setVariable ["ExileAccessCode",(ExileClientRememberVehiclePin select 1)];
	};
}
else
{
	["Whoops", [_message]] call BIS_fnc_showNotification;
	if(_object == (ExileClientRememberVehiclePin select 0)) then {
		_object setVariable ["ExileAccessCode",""];
	};
};
call ExileClient_gui_interactionMenu_unhook;
true