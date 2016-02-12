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
add custom Variables for virtuel items, if user has executed the following command in the units Init:
_nil = [this, "SHIRT ITEM", "PANTS ITEM", "SHOES ITEM", "BACKPACK ITEM", "VEST ITEM"] execVM "CW_ACIM\Scripts\User\user_variables_items_add.sqf";

*/
private ["_unit", "_shirtitem", "_pantsitem", "_shoesitem", "_backpackitem","_vestitem"];


_unit = _this select 0;

_shirtitem = _this select 1;
_pantsitem = _this select 2;
_shoesitem = _this select 3;
_backpackitem = _this select 4;
_vestitem = _this select 5;



If !(isNil "_shirtitem") then {_unit setVariable ["acim_custom_shirtitem", _shirtitem, true];};

If !(isNil "_pantsitem") then {_unit setVariable ["acim_custom_pantsitem", _pantsitem, true];};

If !(isNil "_shoesitem") then {_unit setVariable ["acim_custom_shoesitem", _shoesitem, true];};

If !(isNil "_backpackitem") then {_unit setVariable ["acim_custom_backpackitem", _backpackitem, true];};

If !(isNil "_vestitem") then {_unit setVariable ["acim_custom_vestitem", _vestitem, true];};
