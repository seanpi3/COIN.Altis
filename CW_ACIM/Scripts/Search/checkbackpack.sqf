_cursZiv = cursorTarget;
_customVar = _cursZiv getvariable "acim_custom_backpackitem";
_alreadyAssignedItem = _cursZiv getVariable "acim_backpack_searched";
_to_assign_item = "ERROR";
_timer = 20;
_backpackitems = backpackitems _cursZiv;
If (isNil "_backpackitems") then {_backpackitems = []};
_ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK = _cursZiv getVariable "ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK";
If (isNil "_ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK") then {_ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK = []};


If (isnil "_cursZiv" OR side _cursZiv != civilian OR player distance _cursZiv > 2) exitWith {hint (localize "STR_CW_ACIM_STRINGS_NOCIVINSUR")};//CIV CHECK
If (acim_player_is_searching) exitWith {hint "You're already checkinhg some one else";};	//PLAYER SEARCHING?

acim_player_is_searching = true;


If !(isNil "_alreadyAssignedItem") then {_to_assign_item = _alreadyAssignedItem;};
If !(isNil "_customVar") then {_to_assign_item = _customVar;};
If (isNil "_alreadyAssignedItem" && isNil "_customVar") then {_ACIM_Funds_Backpack = ACIM_Funds_Backpack call fn_prioritySelect;_to_assign_item = _ACIM_Funds_Backpack;};

_cursZiv setVariable ["acim_backpack_searched", _to_assign_item, true]; //SET SEARCHED ITEM VARIABLE

while {_timer > 0} do
{
	If (player distance _cursZiv > 2) exitWith 			//IF PLAYER TOO FAR AWAY.....
	{
		hint (localize "STR_CW_ACIM_STRINGS_TOOFAR");	//...HINT IT!!!
		acim_player_is_searching = false;	//...SET PLAYER SEARCHING VARIABLE TO FALSE
		_cursZiv setVariable ["acim_backpack_searched", nil]; //...RESET SEARCHED ITEM VARIABLE
	};
	If (animationState player != "AinvPknlMstpSlayWrflDnon_medic")then //IF PLAYER ISN'T IN "MEDIC" ANIMATION....
	{
		[[player, "AinvPknlMstpSlayWrflDnon_medic"],"fn_switchMoveGlobal",true,false] call BIS_fnc_MP;	//....THEN SWITCHMOVE
	};
	hint parseText format ["<t size='2' font='PuristaBold' color='#FFFFFF'>%1</t>", _timer];	//TIMER HINT
	_timer= _timer-1;
	sleep 1;
};




If (_timer == 0) then 
{
	If (isNil {_cursZiv getvariable "acim_backpack_searched"}) then 
	{  
		["acim_backpack_searched", _to_assign_item, true];
	};
	
	hint parseText format ["<t size='1.5' font='PuristaBold' color='#FFFFFF'>You found:</t><t size='1.5' font='PuristaBold' color='#00FF11'><br /><br />%1</t>",_to_assign_item];
	
	_cursZivInvVar = _cursZiv getVariable "ACIM_CIV_INVENTORY";
	If (isNil "_cursZivInvVar")then{_cursZivInvVar = [];};
	
	If ({_x == _to_assign_item} count _ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK == 0) then 
	{
		If (_to_assign_item != (localize "STR_CW_ACIM_FINDS_Nothing")) then {ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK = ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK + [_to_assign_item];};
		
		_cursZiv setVariable ["ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK", _ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK + [_to_assign_item], true];
	
		If (_to_assign_item == (localize "STR_CW_ACIM_FINDS_Nothing")) then {_cursZiv setVariable ["ACIM_CIV_INVENTORY", _cursZivInvVar + _backpackitems, true];};
		If (_to_assign_item != (localize "STR_CW_ACIM_FINDS_Nothing")) then {_cursZiv setVariable ["ACIM_CIV_INVENTORY", _cursZivInvVar + [_to_assign_item] + _backpackitems, true];};
	};
	acim_player_is_searching = false;
};









