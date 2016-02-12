/*		 ___			  ____________		 ___       ___           ___
		/   \			 |            |		|	|	  |	  \         /   |
	   /     \			 |    ________|		|	|	  |	   \       /	|
	  /		  \		 	 |   |				|	|	  |     \     /		|
	 /	 / \   \		 |   |				|	|	  |  |\  \___/	/|	|
	/   /___\   \		 |   |				|	|	  |	 | \	   / |	|
   /   _______   \	   	 |   |				|	|	  |	 |  \_____/	 |	|
  /   /       \   \		 |   |_________		|	|	  |	 |			 |	|
 /   /         \   \	 |             |	|	|	  |	 |			 |	|
/___/           \___\	 |_____________|	|___|	  |__|			 |__|
by: Chief Wiggum
*/
_cursZiv = cursorTarget;

If (isnil "_cursZiv" OR side _cursZiv != civilian OR player distance _cursZiv > 2) exitWith {hint (localize "STR_CW_ACIM_STRINGS_NOCIVINSUR")};

If (!isnil "_cursZiv" && side _cursZiv == civilian && player distance _cursZiv <= 2 && animationState _cursZiv != "AmovPercMstpSnonWnonDnon_Ease" && !isPlayer _cursZiv) exitWith 
{
	//If("cba_network" in activatedAddons) then {[_cursZiv, "handcuff",5] call CBA_fnc_globalSay3d;};
	_cursZiv setUnitPos "UP";
	[[_cursZiv, "AmovPercMstpSnonWnonDnon_Ease"],"fn_switchMoveGlobal",true,false] call BIS_fnc_MP;
	[[_cursZiv,"ANIM"],"acim_fn_ai_disable",true,false] call BIS_fnc_MP;

};
If (!isnil "_cursZiv" && side _cursZiv == civilian && player distance _cursZiv <= 2 && animationState _cursZiv != "AmovPercMstpSnonWnonDnon_Ease" && isPlayer _cursZiv) exitWith 
{
	//If("cba_network" in activatedAddons) then {[_cursZiv, "handcuff",5] call CBA_fnc_globalSay3d;};
	_cursZiv setUnitPos "UP";
	[[_cursZiv, "AmovPercMstpSnonWnonDnon_Ease"],"fn_switchMoveGlobal",true,false] call BIS_fnc_MP;
	ACIM_TEMP_EHANDLE_ANIM_CHANGED_HANDCUFF = _cursZiv addeventhandler ["animChanged",{[[_cursZiv, "AmovPercMstpSnonWnonDnon_Ease"],"fn_switchMoveGlobal",true,false] call BIS_fnc_MP;}];

};


If (!isnil "_cursZiv" && side _cursZiv == civilian && player distance _cursZiv <= 2 && animationState _cursZiv == "AmovPercMstpSnonWnonDnon_Ease" && !isPlayer _cursZiv) exitWith 
{
	//If("cba_network" in activatedAddons) then {[_cursZiv, "handcuff",5] call CBA_fnc_globalSay3d;};
	If (player getVariable "acim_is_escorting")exitWith {hint "Stop escorting first!";};
	[[_cursZiv,"ANIM"],"acim_fn_ai_enable",true,false] call BIS_fnc_MP;
	[[_cursZiv, "AmovPercMstpSnonWnonDnon"],"fn_switchMoveGlobal",true,false] call BIS_fnc_MP;
};

If (!isnil "_cursZiv" && side _cursZiv == civilian && player distance _cursZiv <= 2 && animationState _cursZiv == "AmovPercMstpSnonWnonDnon_Ease" && isPlayer _cursZiv) exitWith 
{
	//If("cba_network" in activatedAddons) then {[_cursZiv, "handcuff",5] call CBA_fnc_globalSay3d;};
	If (player getVariable "acim_is_escorting")exitWith {hint "Stop escorting first!";};
	_cursZiv removeEventHandler ACIM_TEMP_EHANDLE_ANIM_CHANGED_HANDCUFF;
	[[_cursZiv, "AmovPercMstpSnonWnonDnon"],"fn_switchMoveGlobal",true,false] call BIS_fnc_MP;
};
