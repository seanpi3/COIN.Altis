_cursZiv = cursorTarget;
_nearVehicle = nearestObjects [player, ["Car","Tank","Air","Truck","Boat"], 7];
_nearVehicle = _nearVehicle select 0;
_passengername = name _cursZiv;
If !(isNil {_cursZiv getVariable "acim_custom_name"})then {_passengername = _cursZiv getVariable "acim_custom_name";};


If (!alive _cursZiv OR side _cursZiv != civilian OR player distance _cursZiv > 2)exitwith{};

If ((_nearVehicle) emptyPositions "cargo"==0) then {hint "VEHICLE FULL"}
else
{

If (player getVariable "acim_is_escorting")then 
{ 
	{ If (side _x == civilian)then {detach _x;};} forEach attachedObjects player;
	player removeAction ACIM_TEMP_ACTION_STOPESCORT;
	player setVariable ["acim_is_escorting", nil];
};

If (animationState _cursZiv == "AmovPercMstpSnonWnonDnon_Ease")then 
{
	_cursZiv setVariable ["acim_moved_in_handcuffed", true, true];
	[[_cursZiv,"ANIM"],"acim_fn_ai_enable",true,false] call BIS_fnc_MP;
	[[_cursZiv, "AmovPercMstpSnonWnonDnon"],"fn_switchMoveGlobal",true,false] call BIS_fnc_MP;
};
waitUntil {animationState _cursZiv == "amovpercmstpsnonwnondnon"};
[[_cursZiv,_nearVehicle],"acim_fn_moveinGlobal",true,false] call BIS_fnc_MP;
_nearVehicle addAction ["Pull out <t color=""#FFFB00"">" +_passengername, "CW_ACIM\Scripts\Arrest\move_outvehicle.sqf", _cursZiv];
};
