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
Tell civilian to get up
*/
_caller = _this select 0;
_distance = _caller getVariable "acim_curVol";

_nearZiv = nearestObjects [_caller, ["civilian"], _distance];

If (isnil "_nearZiv") exitWith {hint (localize "STR_CW_ACIM_STRINGS_NOCIVINSUR")};
If (!isnil "_nearZiv") then {{_x setUnitPos "UP";}forEach _nearZiv;};

[player, "gestureUp"] call acim_fnc_playActionNow;