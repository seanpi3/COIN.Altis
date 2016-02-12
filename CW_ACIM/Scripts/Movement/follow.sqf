_caller = _this select 0;
_cursZiv = _this select 1;
_followvar = _cursZiv getVariable "acim_is_following";
_distance = _caller getVariable "acim_curVol";




If (IsNil "_cursZiv" OR side _cursZiv != civilian OR _caller distance _cursZiv >= _distance) exitWith {};

If !(IsNil "_followvar") exitWith {};

[player, "gestureFollow"] call acim_fnc_playActionNow;

_cursZiv setVariable ["acim_is_following", true, true];
while {_cursZiv getVariable "acim_is_following"} do
{
	_pos = getpos player;
	If !( alive _cursZiv) exitWith {_cursZiv setVariable ["acim_is_following", nil];};
	If !(alive _caller) exitWith {_cursZiv setVariable ["acim_is_following", nil];};
	If (_caller distance _cursZiv >= 100) exitWith {_cursZiv setVariable ["acim_is_following", nil];};
	[[_cursZiv, _pos],"acim_fn_moveGlobal",true,false] call BIS_fnc_MP;
	sleep 0.5;
};

