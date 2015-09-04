/*
	DMS_isPlayerNearbyARRAY
	Created by eraser1

	Usage:
	[
		[
			_position_or_object1,
			_position_or_object2,
			...
			_position_or_objectN
		],
		_radius
	] call DMS_isPlayerNearbyARRAY;


	***DEPRECATED***
*/

private["_posArray","_radius","_result"];


_posArray = _this select 0;
_radius = _this select 1;
_result = false;

{
	if (_result) exitWith {};
	_plyr = _x;
	if (alive _plyr) then
	{
		{
			if (_plyr distance _x <= _radius) exitWith
			{
				_result = true;
				if (DMS_DEBUG) then
				{
					diag_log format["DMS_DEBUG IsPlayerNearbyARRAY :: %1 is within %2m of %3!",_plyr,_radius,_x];
				};
			};
			false;
		} count _posArray;
	};
	false;
} count allPlayers;
_result