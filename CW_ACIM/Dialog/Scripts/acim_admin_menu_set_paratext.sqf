_data = lbCurSel 2101;

switch (_data) do {
case 0: {	
			["INFO_VARS"]execVM "CW_ACIM\Dialog\Scripts\acim_admin_menu_prep_dialog.sqf";
			ctrlSetText [1004, "NAME:"];
			ctrlSetText [1005, "AGE:"];
			ctrlSetText [1006, "BIRTHPLACE:"];
			ctrlSetText [1007, "ANSWERE:"];
		};
case 1: {
			["ITEM_VARS"]execVM "CW_ACIM\Dialog\Scripts\acim_admin_menu_prep_dialog.sqf";
			ctrlSetText [1004, "SHIRT ITEM:"];
			ctrlSetText [1005, "PANTS ITEM:"];
			ctrlSetText [1006, "SHOES ITEM:"];
			ctrlSetText [1007, "BACKPACK ITEM:"];	
			ctrlSetText [1008, "VEST ITEM:"];	
		};
};