//Init for Airdrop Assistance
//Author: Apoc
//
#include "config.sqf"
createRandomSoldierC = call compile preprocessFileLineNumbers "addons\APOC_Airdrop_Assistance\createRandomSoldierC.sqf";


if (isServer) then {
	APOC_srv_startAirdrop 	= compile preprocessFileLineNumbers "addons\APOC_Airdrop_Assistance\APOC_srv_startAirdrop.sqf"; 
};



