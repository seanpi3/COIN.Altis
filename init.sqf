disableSerialization;
enableSaving[false,false];
if(isDedicated) then {
	[] spawn {call compile preprocessFileLineNumbers "addons\EPD\Ied_Init.sqf"};
}
else{
	build = false;
	holstered = false;
	player addAction [format ["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa' color='%1'/> <t color='%1'>[</t>Airdrop Menu<t color='%1'>]</t>", "#FF0000"],"addons\APOC_Airdrop_Assistance\APOC_cli_menu.sqf",[], -100, false, false];
	player setVariable ["bmoney", 500000, true];
	call compile preprocessFileLineNumbers "plank\plank_init.sqf";
	[player, [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]] call plank_api_fnc_forceAddFortifications;
	0 = [] execVM 'player_markers.sqf';
	_igiload = execVM "addons\IgiLoad\IgiLoadInit.sqf";
	waitUntil {!isNull(findDisplay 46)};
};
[] execVM "addons\TAA_Repair_script\TAA_init.sqf";
SLP_init = [] execvm "addons\SLP\SLP_init.sqf";
[] execVM "real_weather.sqf";
execVM "R3F_LOG\init.sqf";
[] execVM "addons\APOC_Airdrop_Assistance\init.sqf";
//call compile preProcessFile "\iniDB\init.sqf";
//execVM "CW_ACIM\ACIM_init.sqf";
//this addAction ["drag","Drag&Drop\Attach_big.sqf",[this],1,true,true,"","_target typeOf "Land_HBarrier_1_F" && _this distance _target < 2"]; 


