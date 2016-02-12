//call compile preProcessFile "\iniDB\init.sqf";
[] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf"};
execVM "CW_ACIM\ACIM_init.sqf";
_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
0 = [] execVM 'player_markers.sqf';

//this addAction ["drag","Drag&Drop\Attach_big.sqf",[this],1,true,true,"","_target typeOf "Land_HBarrier_1_F" && _this distance _target < 2"]; 