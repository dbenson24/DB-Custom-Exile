/**
 * Exile Mod
 * www.exilemod.com
 * Copyright 2015 Exile Mod Team
 * Modified by: Poseidon for Olympus Entertainment
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_condition","_object","_pincode"];
_condition = _this;
_object = ExileClientInteractionObject;

if(_object getVariable["ExileAccessCode",""] != "") then {
	_pincode = (_object getVariable["ExileAccessCode",""]);
	ExileClientPinCode = _pincode;
}else{
	_pincode = 4 call ExileClient_gui_keypadDialog_show;
};

if!(_pincode isEqualTo "")then
{
	["lockToggle",[netId _object,_pincode,_condition]] call ExileClient_system_network_send;
	ExileClientRememberVehiclePin = [_object, _pincode];
};
call ExileClient_gui_interactionMenu_unhook;
true
