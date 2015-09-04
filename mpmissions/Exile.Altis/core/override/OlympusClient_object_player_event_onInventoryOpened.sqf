/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_cancelEvent","_container","_safes"];
_cancelEvent = false;
_container = _this select 1;

if(typeof _container in ["GroundWeaponHolder","WeaponHolderSimulated"]) then {
	_container enableSimulation true;
};


if (ExileClientIsInConstructionMode) then
{
	_cancelEvent = true;	
}
else 
{	
	_safes = player nearObjects ["Exile_Container_Safe", 3];
	{
		if(_x getVariable ["ExileIsLocked",1] isEqualTo -1)exitWith
		{
			ExileClientInventoryOpened = true;
			ExileClientCurrentInventoryContainer = _container;
			["SafeIsLockedWarning"] call ExileClient_gui_notification_event_addNotification;
			_cancelEvent = true;
		};
	} 
	forEach _safes;
	if((locked _container) isEqualTo 2)then
	{
		_cancelEvent = true;
	}
	else
	{
		ExileClientInventoryOpened = true;
		ExileClientCurrentInventoryContainer = _container;
	};
};
_cancelEvent // OKAY!