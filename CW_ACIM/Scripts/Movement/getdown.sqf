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
www.awc-gaming.de

file: checkbackpack.sqf

Description:
Tell civilian to get down
*/
_caller = _this select 0;
_distance = _caller getVariable "acim_curVol";


_nearZiv = nearestObjects [_caller, ["civilian"], _distance];

If (isnil "_nearZiv") exitWith {hint (localize "STR_CW_ACIM_STRINGS_NOCIVINSUR")};
If (!isnil "_nearZiv") then 
{
	//If("cba_network" in activatedAddons) then {[player, "getdown",_distance] call CBA_fnc_globalSay3d;};
	{_x setUnitPos "DOWN";_x disableAi "Move";}forEach _nearZiv;
};

[player, "gestureCover"] call acim_fnc_playActionNow;