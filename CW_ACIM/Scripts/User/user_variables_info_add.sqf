
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

file: ACIM_Dialog.hpp

Description:	
add custom Variables for info, if user has executed the following command in the units Init:
//_nil = [this, "NAME", "AGE", "PLACE OF BIRTH", "ANSWER"] execVM "CW_ACIM\Scripts\User\user_variables_info_add.sqf";

*/
private ["_unit", "_name", "_age", "_pof", "_question"];




_unit = _this select 0;

_name = _this select 1;
_age = _this select 2;
_pof = _this select 3;
_question = _this select 4;


If !(isNil "_name") then {_unit setVariable ["acim_custom_name", _name, true];};

If !(isNil "_age") then {_unit setVariable ["acim_custom_age", _age, true];};

If !(isNil "_pof") then {_unit setVariable ["acim_custom_placeofbirth", _pof, true];};
If !(isNil "_question") then {_unit setVariable ["acim_custom_interrogation", _question, true];};
