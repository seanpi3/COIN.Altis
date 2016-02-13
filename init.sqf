if(isServer) then {
	[] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf"};
	[] execVM "addons\APOC_Airdrop_Assistance\init.sqf";
}
else{
	player addAction [format ["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa' color='%1'/> <t color='%1'>[</t>Airdrop Menu<t color='%1'>]</t>", "#FF0000"],"addons\APOC_Airdrop_Assistance\APOC_cli_menu.sqf",[], -100, false, false];
	player setVariable ["bmoney", 500000, true];
	build = false;
	call compile preprocessFileLineNumbers "plank\plank_init.sqf";
	[player, [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]] call plank_api_fnc_forceAddFortifications;
	0 = [] execVM 'player_markers.sqf';
	_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyDown","_this execVM onKeyDown.sqf"];
};

//call compile preProcessFile "\iniDB\init.sqf";
//execVM "CW_ACIM\ACIM_init.sqf";
//this addAction ["drag","Drag&Drop\Attach_big.sqf",[this],1,true,true,"","_target typeOf "Land_HBarrier_1_F" && _this distance _target < 2"]; 


