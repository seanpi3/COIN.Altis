*********************************************************By [TAA] Jérôme **************************************************************

Add [] execVM "TAA_Repair_script\TAA_init.sqf";
To your init.sqf of your missions

If you want to change the class open TAA_init.sqf and class into Class_allowed
If you want to use TAA Fuel system set TAAFuelSystem true
If you want to see State instead of percent of damage set TAAShowPercentOfDamage false
If you want to change the timing settings open TAA_realistic_repair.sqf

Add :

null = [this] execVM "TAA_Repair_script\TAA_Database.sqf";

to the init of the canister you add on the editor 2d.

//