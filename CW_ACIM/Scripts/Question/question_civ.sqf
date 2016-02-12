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
Question civilian script
*/





_cursZiv = cursorTarget;
_customQuestion = _cursZiv getVariable "acim_custom_interrogation";

If (isnil "_cursZiv" OR side _cursZiv != civilian OR player distance _cursZiv > 2) exitWith {hint (localize "STR_CW_ACIM_STRINGS_NOCIVINSUR")};

If (!(isnil "_cursZiv" OR side _cursZiv != civilian OR player distance _cursZiv > 2) && !(isNil {_cursZiv getVariable "acim_custom_interrogation"}))  exitWith {hint format ["%1", _customQuestion];};

If (!(isnil "_cursZiv" OR side _cursZiv != civilian OR player distance _cursZiv > 2) && (isNil {_cursZiv getVariable "acim_custom_interrogation"}) && !(isNil {_cursZiv getVariable "acim_question_done"}))  exitWith {hint format ["%1", _cursZiv getVariable "acim_question_done"];};

If !(isnil "_cursZiv" OR side _cursZiv != civilian OR player distance _cursZiv > 2) exitWith 
{
	_ACIM_Answeres = ACIM_Answeres call fn_prioritySelect; 
	hint format ["%1", _ACIM_Answeres];
	_cursZiv setVariable ["acim_question_done", _ACIM_Answeres, true];
};
