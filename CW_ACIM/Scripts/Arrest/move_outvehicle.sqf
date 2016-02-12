_ziv_passanger = _this select 3;
_vehicle = _this select 0;
_action = _this select 2;

[[_ziv_passanger],"acim_fn_moveoutGlobal",true,false] call BIS_fnc_MP;
_vehicle removeAction _action;
If (_ziv_passanger getVariable "acim_moved_in_handcuffed")then 
{
	_ziv_passanger setVariable ["acim_moved_in_handcuffed", nil];
	_ziv_passanger setUnitPos "UP";
	[[_ziv_passanger, "AmovPercMstpSnonWnonDnon_Ease"],"fn_switchMoveGlobal",true,false] call BIS_fnc_MP;
	[[_ziv_passanger,"ANIM"],"acim_fn_ai_disable",true,false] call BIS_fnc_MP;
};
