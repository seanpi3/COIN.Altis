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
escort civilian
*/




_cursZiv = cursorTarget;

 
If ((!isnil "_cursZiv" && side _cursZiv == civilian && player distance _cursZiv <= 2 && animationState _cursZiv == "AmovPercMstpSnonWnonDnon_Ease") && !(isNil {player getVariable "acim_is_escorting"})) exitWith {hint (localize "STR_CW_ACIM_STRINGS_YOUESCORT")};

If (isnil "_cursZiv" OR side _cursZiv != civilian OR player distance _cursZiv > 2) exitWith {hint (localize "STR_CW_ACIM_STRINGS_NOCIVINSUR")};

If (!isnil "_cursZiv" && side _cursZiv == civilian && player distance _cursZiv <= 2 && animationState _cursZiv != "AmovPercMstpSnonWnonDnon_Ease") exitWith {hint (localize "STR_CW_ACIM_STRINGS_HASTOHANDCUFF");};

If ((!isnil "_cursZiv" && side _cursZiv == civilian && player distance _cursZiv <= 2 && animationState _cursZiv == "AmovPercMstpSnonWnonDnon_Ease") && (isNil {player getVariable "acim_is_escorting"})) exitWith 
{
	_cursZiv attachTo [player, [0,1,0]];
	player setVariable ["acim_is_escorting", true, true];
	ACIM_TEMP_ACTION_STOPESCORT = player addAction ["Stop Escort","CW_ACIM\Scripts\Arrest\stopeskorte.sqf"];
};
