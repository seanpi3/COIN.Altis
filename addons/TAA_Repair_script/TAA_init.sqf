/* --------------------------------------------------------------------------------
[TAA] Realistic_Repair
BY [TAA]Jérôme 
Thanks to Black Puma and  Jimi Vacarians  for the tips !!
http://www.taa-arma.fr/
-----------------------------------------------------------------------------------
Version 1.1 */
// Set true to activate the Fuel system , false do the opposite. 
TAAFuelSystem = true;

//Set true to show Percentage of damage , set false if you want to see the State instead of the Percentage of damage.
TAAShowPercentOfDamage = true;

call compile preprocessFile "addons\TAA_Repair_Script\TAA_realistic_repair.sqf";
call compile preprocessFile "addons\TAA_Repair_Script\TAA_realistic_repair_air.sqf";
call compile preprocessFile "addons\TAA_Repair_Script\TAA_Fuel_system.sqf";

if (isDedicated) exitWith {};

[] spawn
{	
	waitUntil {player == player};
	
					//Explosive Spécialist
	Class_allowed = ["B_soldier_exp_F"]; // set the class that can repair vehicle , don't put class that can already repair with the repairs default option. Check https://community.bistudio.com/wiki/Arma_3_Assets 
						
	if (typeOf player in  Class_allowed ) then 
	{
		hint "TAA Realistic Repair \nV 1.1 \n-------------------------------- \nBy [TAA] Jerome";
		sleep 10;
		hint "Initialization";
		sleep 5;
		hint "";
		[] spawn TAA_Repairman_Actions;
		sleep 2;
	};
	
	if (TAAFuelSystem) then
	{
		[] spawn TAA_Fuel_Containers_Action;
		hintSilent "TAA Fuel System";
		sleep 5;
		hintSilent "";
	};
	
	player addEventHandler 
	[
		"Respawn", 
		{ 
			[] execVM "addons\TAA_Repair_Script\TAA_init.sqf";
		}
	];
	
};
