ACIM_fnc_createDialog = {
	
	_style = _this select 0;
	_cursZiv = cursorTarget;
	_distance = player getVariable "acim_curVol";
	_nearZiv = nearestObjects [player, ["civilian"], _distance];
	_backpack = backpack _cursZiv;
	_vest = vest _cursZiv;

	SWITCH (_style) do 
	{
		CASE "MAIN": 	{
							closeDialog 0;
							createDialog "ACIM_DIALOG";
							
							ctrlSetText [01, (localize "STR_CW_ACIM_CLOSE")];buttonSetAction [01, "closeDialog 0;"];
							
							If (!isnil "_cursZiv" && side _cursZiv == civilian AND player distance _cursZiv <= 2) then 
							{
								ctrlSetText [03, (localize "STR_CW_ACIM_HEADER_SEARCH")];buttonSetAction [03, "[""SEARCH""]call ACIM_fnc_createDialog"];
								ctrlSetText [04, (localize "STR_CW_ACIM_HEADER_INFO")];buttonSetAction [04, "[""INFO""]call ACIM_fnc_createDialog"];	
								ctrlSetText [05, (localize "STR_CW_ACIM_HEADER_CUSTODY")];buttonSetAction [05, "[""CUSTODY""]call ACIM_fnc_createDialog"];
								ctrlSetText [06, (localize "STR_CW_ACIM_HEADER_INVENTORY")];buttonSetAction [06, "createDialog ""ACIM_INVENTORY"""];						
							};
							
							If (!isnil "_nearZiv") then 
							{
								ctrlSetText [02, (localize "STR_CW_ACIM_HEADER_SHOUT")];buttonSetAction [02, "[""SHOUT""]call ACIM_fnc_createDialog"];			
							};			
							If (serverCommandAvailable "#kick") then {
								ctrlSetText [08, (localize "STR_CW_ACIM_HEADER_ADMIN")];buttonSetAction [08, "[""ADMIN""]call ACIM_fnc_createDialog"];
							}; 
						};
		
		CASE "SEARCH":	{
							closeDialog 0;
							createDialog "ACIM_DIALOG";
							
							ctrlSetText [01, (localize "STR_CW_ACIM_HEADER_BACK")];buttonSetAction [01, "[""MAIN""]call ACIM_fnc_createDialog"];
							
							ctrlSetText [02, (localize "STR_CW_ACIM_CHECKSHIRT")];buttonSetAction [02, "execVM ""CW_ACIM\Scripts\Search\checkshirt.sqf"""];
							ctrlSetText [03, (localize "STR_CW_ACIM_CHECKPANTS")];buttonSetAction [03, "execVM ""CW_ACIM\Scripts\Search\checkpants.sqf"""];
							ctrlSetText [04, (localize "STR_CW_ACIM_CHECKSHOES")];buttonSetAction [04, "execVM ""CW_ACIM\Scripts\Search\checkshoes.sqf"""];
							If ("" == _vest && "" != _backpack) then {ctrlSetText [05, (localize "STR_CW_ACIM_CHECKBACKPACK")];buttonSetAction [05, "execVM ""CW_ACIM\Scripts\Search\checkbackpack.sqf"""];ctrlSetText [06, (localize "STR_CW_ACIM_CHECKVEST")];buttonSetAction [06, "execVM ""CW_ACIM\Scripts\Search\checkvest.sqf"""];};
							If ("" != _vest && "" == _backpack) then {ctrlSetText [06, (localize "STR_CW_ACIM_CHECKBACKPACK")];buttonSetAction [06, "execVM ""CW_ACIM\Scripts\Search\checkbackpack.sqf"""];ctrlSetText [05, (localize "STR_CW_ACIM_CHECKVEST")];buttonSetAction [05, "execVM ""CW_ACIM\Scripts\Search\checkvest.sqf"""];};
							If ("" != _vest && "" != _backpack) then {ctrlSetText [06, (localize "STR_CW_ACIM_CHECKBACKPACK")];buttonSetAction [06, "execVM ""CW_ACIM\Scripts\Search\checkbackpack.sqf"""];ctrlSetText [05, (localize "STR_CW_ACIM_CHECKVEST")];buttonSetAction [05, "execVM ""CW_ACIM\Scripts\Search\checkvest.sqf"""];};
							
							ctrlEnable [08, false];
							ctrlEnable [07, false];
							If (("" != _vest && "" == _backpack) OR ("" == _vest && "" != _backpack)) then {ctrlEnable [06, false];};
							If ("" == _vest && "" == _backpack) then {ctrlEnable [05, false];ctrlEnable [06, false];};
						};
						
		CASE "SHOUT": 	{
							closeDialog 0;
							createDialog "ACIM_DIALOG";
							
							ctrlSetText [01, (localize "STR_CW_ACIM_HEADER_BACK")];buttonSetAction [01, "[""MAIN""]call ACIM_fnc_createDialog"];
							
							ctrlSetText [02, (localize "STR_CW_ACIM_STOP")];buttonSetAction [02, "[[[player], ""CW_ACIM\Scripts\Movement\stop.sqf""], ""BIS_fnc_execVM"", false,false,false ] call BIS_fnc_MP;"];
							ctrlSetText [03, (localize "STR_CW_ACIM_GO")];buttonSetAction [03, "[[[player], ""CW_ACIM\Scripts\Movement\go.sqf""], ""BIS_fnc_execVM"", false,false,false ] call BIS_fnc_MP;"];
							ctrlSetText [04, (localize "STR_CW_ACIM_GETDOWN")];buttonSetAction [04, "[[[player], ""CW_ACIM\Scripts\Movement\getdown.sqf""], ""BIS_fnc_execVM"", false,false,false ] call BIS_fnc_MP;"];
							ctrlSetText [05, (localize "STR_CW_ACIM_GETUP")];buttonSetAction [05, "[[[player], ""CW_ACIM\Scripts\Movement\getup.sqf""], ""BIS_fnc_execVM"", false,false,false ] call BIS_fnc_MP;"];
							
							ctrlEnable [08, false];
							ctrlEnable [07, false];
							ctrlEnable [06, false];
						};
		
		CASE "INFO":	{
							closeDialog 0;
							createDialog "ACIM_DIALOG";
							
							ctrlSetText [01, (localize "STR_CW_ACIM_HEADER_BACK")];buttonSetAction [01, "[""MAIN""]call ACIM_fnc_createDialog"];
							
							ctrlSetText [02, (localize "STR_CW_ACIM_IDCARD")];buttonSetAction [02, "createDialog ""ACIM_Info"""];
							ctrlSetText [03, (localize "STR_CW_ACIM_QUESTION")];buttonSetAction [03, "execVM ""CW_ACIM\Scripts\Question\question_civ.sqf"""];
							
							ctrlEnable [08, false];
							ctrlEnable [07, false];
							ctrlEnable [06, false];
							ctrlEnable [05, false];
							ctrlEnable [04, false];
						};
		
		CASE "CUSTODY":	{
							closeDialog 0;
							createDialog "ACIM_DIALOG";
							
							ctrlSetText [01, (localize "STR_CW_ACIM_HEADER_BACK")];buttonSetAction [01, "[""MAIN""]call ACIM_fnc_createDialog"];
							
							ctrlSetText [02, (localize "STR_CW_ACIM_HANDCUFF")];buttonSetAction [02, "execVM ""CW_ACIM\Scripts\Arrest\handcuff.sqf"";"];
							ctrlSetText [03, (localize "STR_CW_ACIM_ESCORT")];buttonSetAction [03, "execVM ""CW_ACIM\Scripts\Arrest\eskorte.sqf"""];
							ctrlSetText [04, (localize "STR_CW_ACIM_INVEHICLE")];buttonSetAction [04, "execVM ""CW_ACIM\Scripts\Arrest\move_invehicle.sqf"";"];
							ctrlSetText [05, (localize "STR_CW_ACIM_FOLLOW")];buttonSetAction [05, "[player,cursorTarget]execVM ""CW_ACIM\Scripts\Movement\follow.sqf"";closeDialog 0;"];
							
							ctrlEnable [08, false];
							ctrlEnable [07, false];
							ctrlEnable [06, false];
						};
						
		CASE "ADMIN":	{
							closeDialog 0;
							createDialog "ACIM_DIALOG";
							
							ctrlSetText [01, (localize "STR_CW_ACIM_HEADER_BACK")];buttonSetAction [01, "[""MAIN""]call ACIM_fnc_createDialog"];
							
							ctrlSetText [02, (localize "STR_CW_ACIM_ADMINCONSOLE")];buttonSetAction [02, "createDialog ""ACIM_ADMIN_MENU"""];
							
							ctrlEnable [08, false];
							ctrlEnable [07, false];
							ctrlEnable [06, false];
							ctrlEnable [05, false];
							ctrlEnable [04, false];
							ctrlEnable [03, false];
						};
	};
};