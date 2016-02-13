
private ["_Leaderunits","_units","_vehicles","_tanks","_faction","_temparray","_spawnname","_debug","_helo","_plane","_boat"];
if (!isServer) exitWith {};
_faction = _this select 0;
_spawnname = _this select 1;
_temparray = [];
_debug = SLP_ARRAY select 0;


/*/////////////////////////////////////////////////////////////////////////////////////
When you set up the arrays the pilot class is first, then the crew type classes are second
Example:
_units = [ pilot, crew , units....]

*//////////////////////////////////////////////////////////////////////////////////////
//=============================================================================================================================================
switch (_faction) do 
	{    
case 0: //opfor
	{
		_Leaderunits = 	["O_Soldier_TL_F","O_officer_F","O_Soldier_SL_F","O_recon_TL_F"];
		_units =	   	["O_helipilot_F","O_crew_F","O_Soldier_F","O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_AR_F","O_soldier_M_F","O_Soldier_LAT_F","O_medic_F","O_soldier_repair_F",
						"O_soldier_exp_F","O_spotter_F","O_sniper_F","O_Soldier_A_F","O_Soldier_AT_F",
						"O_Soldier_AA_F","O_engineer_F","O_recon_F","O_recon_M_F","O_recon_LAT_F","O_recon_medic_F","O_recon_exp_F","O_recon_JTAC_F",
						"O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AAA_F"
						];//"O_Soldier_diver_base_F","O_diver_F","O_diver_TL_F","O_diver_exp_F",
		_vehicles = 	["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_Quadbike_01_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_APC_Wheeled_02_rcws_F"];
		_tanks = 		["O_APC_Wheeled_02_rcws_F"];
		_helo = 		["O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","O_Heli_Attack_02_F","O_Heli_Attack_02_black_F"];
		_plane =     	[];
		_boat = 		["O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F"];//,"O_Lifeboat"
	};
case 1: //bluefor
	{
		_Leaderunits = 	["B_officer_F","B_Soldier_TL_F","B_recon_TL_F","B_Soldier_SL_F"];
		_units =		["B_Helipilot_F","B_crew_F","B_Soldier_F","B_Soldier_02_f","B_Soldier_03_f","B_Soldier_lite_F","B_Soldier_GL_F","B_soldier_AR_F",
						"B_soldier_M_F","B_soldier_LAT_F","B_medic_F","B_soldier_repair_F","B_soldier_exp_F",
						"B_spotter_F","B_sniper_F","B_RangeMaster_F","B_Soldier_A_F","B_soldier_AT_F","B_soldier_AA_F","B_engineer_F","B_Competitor_F",
						"B_recon_F","B_recon_LAT_F","B_recon_exp_F","B_recon_medic_F","B_recon_M_F","B_recon_JTAC_F","B_soldier_AAR_F","B_soldier_AAT_F","B_soldier_AAA_F"
						];//,"Underwear_F","B_diver_exp_F","B_diver_TL_F","B_Soldier_diver_base_F","B_diver_F",
		_vehicles = 	["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Quadbike_01_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_APC_Wheeled_01_cannon_F"];
		_tanks = 		["B_APC_Tracked_01_rcws_F"];
		_helo = 		["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","B_Heli_Transport_01_F"];
		_plane =        [];
		_boat = 		["B_Boat_Armed_01_minigun_F","B_Boat_Transport_01_F","B_Lifeboat"];		
		};
case 2: //greenfor	
	{
		_Leaderunits = 	["I_Soldier_AR_F","I_Soldier_SL_F","I_Soldier_TL_F"];
		_units =		["I_helipilot_F","I_crew_F","I_Soldier_02_F","I_soldier_F","I_Soldier_lite_F","I_Soldier_A_F","I_Soldier_GL_F","I_Soldier_M_F","I_Soldier_LAT_F",
						"I_Soldier_AT_F","I_Soldier_AA_F","I_medic_F","I_Soldier_repair_F","I_Soldier_exp_F","I_engineer_F","I_helicrew_F","I_officer_F","I_Spotter_F",
						"I_Sniper_F","I_Soldier_AAR_F","I_Soldier_AAT_F","I_Soldier_AAA_F"
						];//"I_Soldier_diver_base_F","I_diver_F","I_diver_exp_F","I_diver_TL_F",
		_vehicles = 	["I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Quadbike_01_F","I_Truck_02_covered_F","I_Truck_02_transport_F"];
		_tanks = 		[];
		_helo = 		["I_Heli_Transport_02_F"];
		_plane =		[];
		_boat = 		["I_Boat_Armed_01_minigun_F","I_Boat_Transport_01_F"];		
	};
case 3: //Civilian	
	{
		_Leaderunits = 	["C_man_1","C_man_1_1_F","C_man_polo_1_F"];
		_units =		["Civilian_F","C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F"];
		_vehicles = 	["C_Offroad_01_F","C_Quadbike_01_F"];
		_tanks = 		[];
		_helo = 		[];
		_plane =		[];
		_boat = 		["C_Rubberboat"];		
	};		 		 

/*case #: //Takistan army	
	{
		_Leaderunits = 	[""];
		_units =		["pilot class","Crew class","units"];
		_vehicles = 	[];
		_tanks = 		[];
		_helo = 		[];
		_plane =		[];
		_boat =         [];
	};		 
*/
Default
	{
		if(_debug == 1) then
		{
			hintc format [ "Error Spawnname %1: SLP_units_config ... Not a valid config number/n/nSpawn call aborted",_spawnname];
		};
	};
};


_temparray = _temparray + [_Leaderunits,_units ,_vehicles,_tanks,_helo,_plane,_boat];

_temparray
    
