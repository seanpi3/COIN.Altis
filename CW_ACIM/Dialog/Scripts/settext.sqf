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
Set text for the ID-Card
*/
private ["_cursZiv", "_customVarName", "_customVarAge", "_customVarPlaceOfBirth", "_agearray", "_placeofbirthArray", "_text_name", "_text_age", "_text_placeofbirth"];




_cursZiv = cursorTarget;

If (isnil "_cursZiv" OR side _cursZiv != civilian OR player distance _cursZiv > 2) exitWith {hint (localize "STR_CW_ACIM_STRINGS_NOCIVINSUR")};

//get User added Variables
_customVarName = _cursZiv getVariable "acim_custom_name";
_customVarAge = _cursZiv getVariable "acim_custom_age";
_customVarPlaceOfBirth = _cursZiv getVariable "acim_custom_placeofbirth";
//-----

//Arrays
_agearray = ACIM_Ages;
_placeofbirthArray= ACIM_PlacesOfBirth;
//---------------------------------------------------------


If (isNil {_cursZiv getVariable "acim_info_checked"}) exitWith {

	_text_name = name _cursZiv;
	_text_age = _agearray select floor random count _agearray;
	_text_placeofbirth = _placeofbirthArray select floor random count _placeofbirthArray;
	
	//User added Vars?
	If !(isNil "_customVarName") then
	{_text_name = _cursZiv getvariable "acim_custom_name";};
	//age added?
	If !(isNil "_customVarAge") then
	{_text_age = _cursZiv getvariable "acim_custom_age";};
	//place of birth added?
	If !(isNil "_customVarPlaceOfBirth") then
	{_text_placeofbirth = _cursZiv getvariable "acim_custom_placeofbirth";}; 

	
	//Set Variables
	_cursZiv setVariable ["acim_default_age", _text_age, true];
	_cursZiv setVariable ["acim_default_pob", _text_placeofbirth, true];
	_cursZiv setVariable ["acim_info_checked", true, true];
	
	//Set Dialog Text...
	ctrlSetText [1005, _text_name];
	ctrlSetText [1006, _text_age];
	ctrlSetText[1007, _text_placeofbirth];
};

If (_cursZiv getVariable "acim_info_checked") exitWith {

	_text_name = name _cursZiv;
	_text_age = _cursZiv getVariable "acim_default_age";
	_text_placeofbirth =  _cursZiv getVariable "acim_default_pob";
	
	//User added Vars?
	If !(isNil "_customVarName") then
	{_text_name = _cursZiv getvariable "acim_custom_name";};
	//age added?
	If !(isNil "_customVarAge") then
	{_text_age = _cursZiv getvariable "acim_custom_age";};
	//place of birth added?
	If !(isNil "_customVarPlaceOfBirth") then
	{_text_placeofbirth = _cursZiv getvariable "acim_custom_placeofbirth";}; 
	
	//Set Dialog Text...
	ctrlSetText [1005, _text_name];
	ctrlSetText [1006, _text_age];
	ctrlSetText[1007, _text_placeofbirth];
};

