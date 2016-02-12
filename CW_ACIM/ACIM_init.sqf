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
Hint "starting ACIM setup..";

//Functions
execVM "CW_ACIM\Functions\fn_priority_select.sqf";
execVM "CW_ACIM\Functions\fn_switchMoveGlobal.sqf";
execVM "CW_ACIM\Functions\fn_moveGlobal.sqf";
execVM "CW_ACIM\Functions\fn_moveinGLobal.sqf";
execVM "CW_ACIM\Functions\fn_moveoutGlobal.sqf"; 
execVM "CW_ACIM\Functions\fn_en_disable.sqf";
execVM "CW_ACIM\Functions\fn_createDialog.sqf";
execVM "CW_ACIM\Functions\fn_playActionNow.sqf";
execVM "CW_ACIM\Functions\fn_handleACIM_INV.sqf";
execVM "CW_ACIM\Functions\fn_updateUsedItemsArray.sqf";

//Hotkeys
execVM "CW_ACIM\Scripts\User\acim_hotkeys.sqf";

//Configuration
execVM "CW_ACIM\Configuration\items_shirt.sqf";
execVM "CW_ACIM\Configuration\items_pants.sqf";
execVM "CW_ACIM\Configuration\items_shoes.sqf";
execVM "CW_ACIM\Configuration\items_backpack.sqf";
execVM "CW_ACIM\Configuration\items_vest.sqf";
execVM "CW_ACIM\Configuration\acim_setup.sqf";
execVM "CW_ACIM\Configuration\answers.sqf";
execVM "CW_ACIM\Configuration\ages.sqf";
execVM "CW_ACIM\Configuration\placeofbirth.sqf";


























