/* --------------------------------------------------------------------------------
[TAA] Realistic_Repair
BY [TAA]Jérôme 
Thanks to Black Puma and Jimi Vacarians  for the tips !
http://www.taa-arma.fr/
-----------------------------------------------------------------------------------
*/

//set up the timer you want for repair
//****************************** LAND VEHICLE *************************************
Wheel_damage_over80 = 30;
Wheel_damage_between50and80 = 20;
Wheel_damage_between25and50 = 10;
Wheel_damage_below25 = 5;

Secondary_Wheel_damage_over80 = 30;
Secondary_Wheel_damage_between50and80 = 15;
Secondary_Wheel_damage_between25and50 = 10;
Secondary_Wheel_damage_below25 = 5;

Track_damage_over80 = 90;
Track_damage_between50and80 = 60;
Track_damage_between25and50 = 48;
Track_damage_below25 = 24;

Turret_damage_over80 = 100;
Turret_damage_between50and80 = 80;
Turret_damage_between25and50 = 63;
Turret_damage_below25 = 32;

Gun_damage_over80 = 100;
Gun_damage_between50and80 = 80;
Gun_damage_between25and50 = 57;
Gun_damage_below25 = 29;

Hull_damage_over80 = 120;
Hull_damage_between50and80 = 95;
Hull_damage_between25and50 = 75;
Hull_damage_below25 = 38;

Fuel_damage_over80 = 90;
Fuel_damage_between50and80 = 75;
Fuel_damage_between25and50 = 38;
Fuel_damage_below25 = 17;

Engine_damage_over80 = 100; 
Engine_damage_between50and80 = 88;
Engine_damage_between25and50 = 75;
Engine_damage_below25 = 38; 

//****************************** AIR VEHICLE *************************************
Air_Engine_damage_over80 = 60;
Air_Engine_damage_between50and80 = 40;
Air_Engine_damage_between25and50 = 20;
Air_Engine_damage_below25 = 10;

Air_Main_Rotor_damage_over80 = 80;
Air_Main_Rotor_damage_between50and80 = 50;
Air_Main_Rotor_damage_between25and50 = 25;
Air_Main_Rotor_damage_below25 = 20;

Air_Tail_Rotor_damage_over80 = 50;
Air_Tail_Rotor_damage_between50and80 = 25;
Air_Tail_Rotor_damage_between25and50 = 15;
Air_Tail_Rotor_damage_below25 = 10;

Air_Fuel_damage_over80 = 60;
Air_Fuel_damage_between50and80 = 40;
Air_Fuel_damage_between25and50 = 20;
Air_Fuel_damage_below25 = 10;

Air_Avionics_damage_over80 = 100;
Air_Avionics_damage_between50and80 = 80;
Air_Avionics_damage_between25and50 = 50;
Air_Avionics_damage_below25 = 30;

Air_Hull_damage_between0and10 = 20;
Air_Hull_damage_between10and20 = 25;
Air_Hull_damage_between20and30 = 30;
Air_Hull_damage_between30and40 = 40;
Air_Hull_damage_between40and50 = 50;
Air_Hull_damage_between50and60 = 70;
Air_Hull_damage_between60and70 = 90;
Air_Hull_damage_between70and80 = 120;
Air_Hull_damage_between80and90 = 150;
Air_Hull_damage_between90and100 = 190;
/*
***************************************************************************************************************************************************************************************************************
********************************************************************************** DO NOT EDIT BELOW **********************************************************************************************************
***************************************************************************************************************************************************************************************************************
*/

#define TAA_STANDBY "Repairs Has Been Stopped"
#define TAA_NO_TOOLKIT "You Need A Toolkit To Repair This Vehicle"
#define TAA_CANCELLED "Repairs Has Been Cancelled"

//set text size , color and position
TAA_text = 
{
	 [ format["<t size='0.75' color='#FF0000'>%1</t>",_this], 0,1,5,0,0,301] spawn bis_fnc_dynamicText;
};

//Action the repairman can do 
TAA_Repairman_Actions =
{	
	resumehasbeendone = true;

	Reparationiscancelled = false;
	
	vehiclehasbeencheck = false;
	
	vehicleisbeingrepaired = false;
	
	Aircrafthasbeencheck = false;
	
	add1Exist = true;
	add2Exist = true;
	add10Exist = true;
	add11Exist = true;
	
	add1 = player addAction ["<t color=""#FFFF00"">" + "Check Vehicle" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_check"], 10, true, true, "", "call TAA_vehicle_statute"];
	add2 = player addAction ["<t color=""#FFFF00"">" + "Repair Vehicle" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_repair"], 10, true, true, "", "call TAA_vehicle_check_repair"];
	
	add10 = player addAction ["<t color=""#7fc900"">" + "Check Aircraft" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_check_air"], 10, true, true, "", "call TAA_Air_statute"];
	add11 = player addAction ["<t color=""#7fc900"">" + "Repair Aircraft" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_repair_air"], 10, true, true, "", "call TAA_vehicle_check_repair"];
	
	while { true} do 
	{
		private ["_vehicle","_detection","_detectionair"];
		_vehicle = ["B_MRAP_01_F"];
		_detection = nearestObjects [player, ["Car","Truck","Tank"], 8];
		_detectionair = nearestObjects [player, ["Air"], 8];
		if (count _detection > 0 && vehicle player == player) then
		 {    

        	if(!add1Exist) then {
				add1 = player addAction ["<t color=""#FFFF00"">" + "Check Vehicle" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_check"], 10, true, true, "", "call TAA_vehicle_statute"];
				add1Exist = true;
			};

			if(!add2Exist) then {
				add2 = player addAction ["<t color=""#FFFF00"">" + "Repair Vehicle" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_repair"], 10, true, true, "", "call TAA_vehicle_check_repair"];
				add2Exist = true;
			};
		}
        else
        {
			
			if(add1Exist) then {
            	player removeAction add1;
            	add1Exist = false;
				vehiclehasbeencheckforrefuel = false;
			};

            if(add2Exist) then {
            	player removeAction add2;
            	add2Exist = false;
				vehiclehasbeencheck = false;
			};
		};
		
		if (count _detectionair > 0 && vehicle player == player) then
		{    
			if(!add10Exist) then {
				add10 = player addAction ["<t color=""#7fc900"">" + "Check Aircraft" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_check_air"], 10, true, true, "", "call TAA_Air_statute"];
				add10Exist = true;
			};
			
			if(!add11Exist) then {
				add11 = player addAction ["<t color=""#7fc900"">" + "Repair Aircraft" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_repair_air"], 10, true, true, "", "call TAA_vehicle_check_repair"];
				add11Exist = true;
			};
		}
		else
		{
			if(add10Exist) then {
            	player removeAction add10;
            	add10Exist = false;
				vehiclehasbeencheckforrefuel = false;
			};
			
			if(add11Exist) then {
            	player removeAction add11;
            	add11Exist = false;
				Aircrafthasbeencheck = false;
			};
		};
		sleep 0.5;
	};
};

/*
***************************************************************************************************************************************************************************************************************
***************************************************************************************** LAND VEHICLE ********************************************************************************************************
***************************************************************************************************************************************************************************************************************
*/

//Show the informations about the vehicle
TAA_vehicle_informations =
{
	//"HitLFWheel","HitLBWheel","HitLMWheel","HitLF2Wheel","HitRFWheel","HitRBWheel","HitRMWheel","HitRF2Wheel" ,"HitEngine", "HitLTrack","HitRTrack","HitFuel","HitTurret","HitGun","HitHull"
	private ["_veh","_vehname"];
	_veh = _this select 0;
	_vehname = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");
	clean = false;
	//Check damages on each parts of the targeted vehicle 
	LForward_WHEEL_STAT = _veh getHitPointDamage ("HitLFWheel");
	if ( isNil {_veh getHitPointDamage ("HitLFWheel")}) then
	{
		LForward_WHEEL_STAT = parseText "None";
		LFW = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitLFWheel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			LForward_WHEEL_STAT = round ( LForward_WHEEL_STAT * 100 );
		}
		else
		{
			LForward_WHEEL_STAT = 100 - (round ( LForward_WHEEL_STAT * 100 ));
		};
		LFW = true;
	};
	
	LBack_WHEEL_STAT = _veh getHitPointDamage ("HitLBWheel");
	if ( isNil {_veh getHitPointDamage ("HitLBWheel")}) then
	{
		LBack_WHEEL_STAT = parseText "None";
		LBW = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitLBWheel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			LBack_WHEEL_STAT = round ( LBack_WHEEL_STAT * 100 );
		}
		else
		{
			LBack_WHEEL_STAT = 100 - (round ( LBack_WHEEL_STAT * 100 ));
		};
		LBW = true;
	};

	LMiddle_WHEEL_STAT = _veh getHitPointDamage ("HitLMWheel");
	if ( isNil {_veh getHitPointDamage ("HitLMWheel")}) then
	{
		LMiddle_WHEEL_STAT = parseText "None";
		LMW = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitLMWheel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			LMiddle_WHEEL_STAT = round ( LMiddle_WHEEL_STAT * 100 );
		}
		else
		{
			LMiddle_WHEEL_STAT = 100 - (round ( LMiddle_WHEEL_STAT * 100 ));
		};
		LMW = true;
	};
	
	LForward2_WHEEL_STAT = _veh getHitPointDamage ("HitLF2Wheel");
	if ( isNil {_veh getHitPointDamage ("HitLF2Wheel")}) then
	{
		LForward2_WHEEL_STAT = parseText "None";
		LF2W = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitLF2Wheel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			LForward2_WHEEL_STAT = round ( LForward2_WHEEL_STAT * 100 );
		}
		else
		{
			LForward2_WHEEL_STAT = 100 - (round ( LForward2_WHEEL_STAT * 100 ));	
		};
		LF2W = true;
	};

	RForward_WHEEL_STAT = _veh getHitPointDamage ("HitRFWheel");
	if ( isNil {_veh getHitPointDamage ("HitRFWheel")}) then
	{
		RForward_WHEEL_STAT = parseText "None";
		RFW = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitRFWheel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			RForward_WHEEL_STAT = round ( RForward_WHEEL_STAT * 100 );
		}
		else
		{
			RForward_WHEEL_STAT = 100 - (round ( RForward_WHEEL_STAT * 100 ));
		};
		RFW = true;
	};

	RBack_WHEEL_STAT = _veh getHitPointDamage ("HitRBWheel");
	if ( isNil {_veh getHitPointDamage ("HitRBWheel")}) then
	{
		RBack_WHEEL_STAT = parseText "None";
		RBW = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitRBWheel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			RBack_WHEEL_STAT = round ( RBack_WHEEL_STAT * 100 );
		}
		else
		{
			RBack_WHEEL_STAT = 100 - (round ( RBack_WHEEL_STAT * 100 ));
		};
		RBW = true;
	};

	RMiddle_WHEEL_STAT = _veh getHitPointDamage ("HitRMWheel");
	if ( isNil {_veh getHitPointDamage ("HitRMWheel")}) then
	{
		RMiddle_WHEEL_STAT = parseText "None";
		RMW = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitRMWheel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			RMiddle_WHEEL_STAT = round ( RMiddle_WHEEL_STAT * 100 );
		}
		else
		{
			RMiddle_WHEEL_STAT = 100 - (round ( RMiddle_WHEEL_STAT * 100 ));
		};	
		RMW = true;
	};

	RForward2_WHEEL_STAT = _veh getHitPointDamage ("HitRF2Wheel");
	if ( isNil {_veh getHitPointDamage ("HitRF2Wheel")}) then
	{
		RForward2_WHEEL_STAT = parseText "None";
		RF2W = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitRF2Wheel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			RForward2_WHEEL_STAT = round ( RForward2_WHEEL_STAT * 100 );
		}
		else
		{
			RForward2_WHEEL_STAT = 100 - (round ( RForward2_WHEEL_STAT * 100 ));
		};
		RF2W = true;
	};
	
	Left_TRACK_STAT = _veh getHitPointDamage ("HitLTrack");
	if ( isNil { _veh getHitPointDamage ("HitLTrack")}) then
	{
		Left_TRACK_STAT =  parseText "None";
		LTCK = false;
	};
	if ( !isNil { _veh getHitPointDamage ("HitLTrack")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			Left_TRACK_STAT = round ( Left_TRACK_STAT * 100 );
		}
		else
		{
			Left_TRACK_STAT = 100 - (round ( Left_TRACK_STAT * 100 ));
		};
		LTCK = true;
	};
	
	Right_TRACK_STAT = _veh getHitPointDamage ("HitRTrack");
	if ( isNil {_veh getHitPointDamage ("HitRTrack")}) then
	{
		Right_TRACK_STAT =  parseText "None";
		RTCK = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitRTrack")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			Right_TRACK_STAT = round ( Right_TRACK_STAT * 100 );
		}
		else
		{
			Right_TRACK_STAT = 100 - (round ( Right_TRACK_STAT * 100 ));
		};	
		RTCK = true;
	};
	
	TURRET_STAT = _veh getHitPointDamage ("HitTurret");
	if ( isNil {_veh getHitPointDamage ("HitTurret")}) then
	{
		TURRET_STAT = parseText "None";
		TRET = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitTurret")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			TURRET_STAT = round ( TURRET_STAT * 100 );
		}
		else
		{
			TURRET_STAT = 100 - (round ( TURRET_STAT * 100 ));
		};
		TRET = true;
	};
	
	GUN_STAT = _veh getHitPointDamage ("HitGun");
	if ( isNil { _veh getHitPointDamage ("HitGun")}) then
	{
		GUN_STAT = parseText "None";
		GUN = false;
	};
	if ( !isNil { _veh getHitPointDamage ("HitGun")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			GUN_STAT = round ( GUN_STAT * 100 );
		}
		else
		{
			GUN_STAT = 100 - (round ( GUN_STAT * 100 ));
		};
		GUN = true;
	};
	
	HULL_STAT = _veh getHitPointDamage ("HitHull");
	if ( isNil { _veh getHitPointDamage ("HitHull")}) then
	{
		HULL_STAT = parseText "Not Repairable";
		HULL = false;
	};
	if ( !isNil { _veh getHitPointDamage ("HitHull")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			HULL_STAT = round ( HULL_STAT * 100 );
		}
		else
		{
			HULL_STAT = 100 - (round ( HULL_STAT * 100 ));
		};	
		HULL = true;
	};
	
	FUEL_STAT = _veh getHitPointDamage ("HitFuel");
	if ( isNil { _veh getHitPointDamage ("HitFuel")}) then
	{
		FUEL_STAT = parseText "Not Repairable";
		FUELL = false;
	};
	if ( !isNil { _veh getHitPointDamage ("HitFuel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			FUEL_STAT = round ( FUEL_STAT * 100 );
		}
		else
		{
			FUEL_STAT = 100 - (round ( FUEL_STAT * 100 ));
		};
		FUELL = true;
	};
	
	ENGINE_STAT = _veh getHitPointDamage ("HitEngine");
	if ( isNil {_veh getHitPointDamage ("HitEngine")}) then
	{
		ENGINE_STAT = parseText "Not Repairable";
		ENGI = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitEngine")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			ENGINE_STAT = round ( ENGINE_STAT * 100 );
		}
		else
		{
			ENGINE_STAT = 100 - (round ( ENGINE_STAT * 100 ));
		};
		ENGI = true;
	};
	
	OIL_STAT = Fuel _veh;
	OIL_STAT = round ( OIL_STAT * 100 );
	
	hint "Checking Vehicle .";
	sleep 0.5;
	hint "Checking Vehicle ..";
	sleep 0.5;
	hint "Checking Vehicle ...";
	sleep 0.5;
	hint "Checking Vehicle ....";
	sleep 0.5;
	hint "";
	//								Yellow									Blue Light																					Green
	_text1 = parseText Format["<t color='#FFFF00'>Type of vehicle :</t><t color='#00FFFF'> %1</t>%<br /><t color='#FFFF00'>-------------------------------</t><br /><t color='#00FF00'><t align='right'>Percentage of damages</t></t><br />" ,_vehname];
	_text2 = parseText Format["Left Front Wheel : <t color='#ff0000'><t align='right'>%1</t></t><br />Right Front Wheel : <t color='#ff0000'><t align='right'>%2</t></t><br />" ,LForward_WHEEL_STAT,RForward_WHEEL_STAT];
	_text3 = parseText Format["Left Back Wheel : <t color='#ff0000'><t align='right'>%1</t></t><br />Right Back Wheel : <t color='#ff0000'><t align='right'>%2</t></t><br />" ,LBack_WHEEL_STAT,RBack_WHEEL_STAT];
	_text4 = parseText Format["Engine : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,ENGINE_STAT];
	_text5 = parseText Format["Fuel Tank : <t color='#ff0000'><t align='right'>%1</t></t><br />",FUEL_STAT];
	_text6 = parseText Format["Hull : <t color='#ff0000'><t align='right'>%1</t></t><br />",HULL_STAT];
	_text7 = parseText Format["Left Track : <t color='#ff0000'><t align='right'>%1</t></t><br />Right Track : <t color='#ff0000'><t align='right'>%2</t></t><br />" ,Left_TRACK_STAT,Right_TRACK_STAT];
	_text8 = parseText Format["Turret : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,TURRET_STAT];
	_text9 = parseText Format["Gun : <t color='#ff0000'><t align='right'>%1</t></t><br />",GUN_STAT];
	_text10 = parseText Format["Left Middle Wheel : <t color='#ff0000'><t align='right'>%1</t></t><br />Right Middle Wheel : <t color='#ff0000'><t align='right'>%2</t></t><br />" ,LMiddle_WHEEL_STAT,RMiddle_WHEEL_STAT];
	_text11 = parseText Format["Left Front 2nd Wheel : <t color='#ff0000'><t align='right'>%1</t></t><br />Right Front 2nd Wheel : <t color='#ff0000'><t align='right'>%2</t></t><br />" ,LForward2_WHEEL_STAT,RForward2_WHEEL_STAT];
	_text12 = parseText Format["<t color='#FFFF00'>-------------------------------</t><br />Fuel Level : <t color='#00FFFF'><t align='right'>%1</t>",OIL_STAT];
	
	if (!TAAShowPercentOfDamage) then
	{
		_text1 = parseText Format["<t color='#FFFF00'>Type of vehicle :</t><t color='#00FFFF'> %1</t>%<br /><t color='#FFFF00'>-------------------------------</t><br /><t color='#FFA500'><t align='right'>State</t></t><br />" ,_vehname];
		_text2 = parseText Format["Left Front Wheel : <t color='#00FF00'><t align='right'>%1</t></t><br />Right Front Wheel : <t color='#00FF00'><t align='right'>%2</t></t><br />" ,LForward_WHEEL_STAT,RForward_WHEEL_STAT];
		_text3 = parseText Format["Left Back Wheel : <t color='#00FF00'><t align='right'>%1</t></t><br />Right Back Wheel : <t color='#00FF00'><t align='right'>%2</t></t><br />" ,LBack_WHEEL_STAT,RBack_WHEEL_STAT];
		_text4 = parseText Format["Engine : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,ENGINE_STAT];
		_text5 = parseText Format["Fuel Tank : <t color='#00FF00'><t align='right'>%1</t></t><br />",FUEL_STAT];
		_text6 = parseText Format["Hull : <t color='#00FF00'><t align='right'>%1</t></t><br />",HULL_STAT];
		_text7 = parseText Format["Left Track : <t color='#00FF00'><t align='right'>%1</t></t><br />Right Track : <t color='#00FF00'><t align='right'>%2</t></t><br />" ,Left_TRACK_STAT,Right_TRACK_STAT];
		_text8 = parseText Format["Turret : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,TURRET_STAT];
		_text9 = parseText Format["Gun : <t color='#00FF00'><t align='right'>%1</t></t><br />",GUN_STAT];
		_text10 = parseText Format["Left Middle Wheel : <t color='#00FF00'><t align='right'>%1</t></t><br />Right Middle Wheel : <t color='#00FF00'><t align='right'>%2</t></t><br />" ,LMiddle_WHEEL_STAT,RMiddle_WHEEL_STAT];
		_text11 = parseText Format["Left Front 2nd Wheel : <t color='#00FF00'><t align='right'>%1</t></t><br />Right Front 2nd Wheel : <t color='#00FF00'><t align='right'>%2</t></t><br />" ,LForward2_WHEEL_STAT,RForward2_WHEEL_STAT];
	};
	
	if ( !LFW || !RFW ) then
	{
		_text2 = parseText Format[""];
	};
	
	if ( !LBW || !RBW ) then
	{
		_text3 = parseText Format[""];
	};
	
	if ( !ENGI ) then
	{
		_text4 = parseText Format[""];
	};
	
	if ( !FUELL ) then
	{
		_text5 = parseText Format[""];
	};
	
	if ( !HULL ) then
	{
		_text6 = parseText Format[""];
	};
	
	if ( !LTCK || !RTCK ) then
	{
		_text7 = parseText Format[""];
	};
	
	if ( !TRET ) then
	{
		_text8 = parseText Format[""];
	};
	
	if ( !GUN ) then
	{
		_text9 = parseText Format[""];
	};
	
	if ( !LMW || !RMW ) then
	{
		_text10 = parseText Format[""];
	};
	
	if ( !LF2W || !RF2W ) then
	{
		_text11 = parseText Format[""];
	};
	
	if (!TAAFuelSystem ) then
	{
		_text12 = parseText Format[""];
	};
	
	_textf = composeText [_text1,_text2,_text3,_text4,_text5,_text6,_text7,_text8,_text9,_text10,_text11,_text12]; 
	[_textf , "[TAA] Realistic Repair ", true, false] call BIS_fnc_GUImessage;

	vehiclehasbeencheck = true;
	vehiclehasbeencheckforrefuel = true;
	if ( OIL_STAT == 100 ) then
	{
		TankFULL = true;
	}
	else
	{
		TankFULL = false;
	};	
};

//Check if the vehicle is not destroyed and not being repaired
TAA_vehicle_statute =
{
	private ["_target"];
	_target = cursorTarget;
	_return = false;
	if ( alive player && (damage _target) < 1 && !vehicleisbeingrepaired) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};
	_return
};


//Check if reparations are needed and if the repairman got a toolkit and the vehicle is not being repaired
TAA_vehicle_check_repair =
{
	private ["_target"];
	_target = cursorTarget;
	_return = false;
	if ( (damage _target) == 0 ) then //avoid the abilities to repair in one second if you damaged the vehicle after you've checked it.
	{
		clean = true;
	};
	if (clean) then
	{
		if ( (damage _target) != 0 ) then
		{
			vehiclehasbeencheck = false;		
		};
	};

	if ( (damage _target) != 0 && ( vehiclehasbeencheck || Aircrafthasbeencheck ) && !vehicleisbeingrepaired) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};
	_return
};

//Set the timer for repairing based on the actual damages of the vehicle being repair
TAA_vehicle_repairing = 
{
	if ("ToolKit" in (items player)) then
	{
		_Time_For_Repair = 0;
		if (TAAShowPercentOfDamage) then{
		if (LFW)then
		{
			if ( LForward_WHEEL_STAT != 0 ) then
			{
				if ( LForward_WHEEL_STAT >= 50 ) then
				{
					if ( LForward_WHEEL_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between50and80;
					};
				};
				if ( LForward_WHEEL_STAT < 50 ) then
				{
					if ( LForward_WHEEL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_below25;
					};
				};
			};
		};	
		
		
		if (LBW) then
		{
			if ( LBack_WHEEL_STAT != 0 ) then
			{
				if (LBack_WHEEL_STAT >= 50 ) then
				{
					if ( LBack_WHEEL_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between50and80;
					};
				};
				if ( LBack_WHEEL_STAT < 50 ) then
				{
					if ( LBack_WHEEL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_below25;
					};
				};
			};
		};	
		
		
		if (LMW) then
		{
			if ( LMiddle_WHEEL_STAT != 0 ) then
			{
				if (LMiddle_WHEEL_STAT >= 50 ) then
				{
					if ( LMiddle_WHEEL_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between50and80;
					};
				};
				if ( LMiddle_WHEEL_STAT < 50 ) then
				{
					if ( LMiddle_WHEEL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_below25;
					};
				};
			};
		};	
			

		if (LF2W) then
		{
			if ( LForward2_WHEEL_STAT != 0 ) then
			{
				if (LForward2_WHEEL_STAT >= 50 ) then
				{
					if ( LForward2_WHEEL_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between50and80;
					};
				};
				if ( LForward2_WHEEL_STAT < 50 ) then
				{
					if ( LForward2_WHEEL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_below25;
					};
				};
			};
		};	

		
		if (RFW) then
		{
			if ( RForward_WHEEL_STAT != 0 ) then
			{
				if (RForward_WHEEL_STAT >= 50 ) then
				{
					if ( RForward_WHEEL_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between50and80;
					};	
				};
				if ( RForward_WHEEL_STAT < 50 ) then
				{
					if ( RForward_WHEEL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_below25;
					};	
				};
			};
		};	
		
		
		if (RBW) then
		{
			if ( RBack_WHEEL_STAT != 0 ) then
			{
				if (RBack_WHEEL_STAT >= 50 ) then
				{
					if ( RBack_WHEEL_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between50and80;
					};
				};
				if ( RBack_WHEEL_STAT < 50 ) then
				{
					if ( RBack_WHEEL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_below25;
					};
				};
			};
		};
		
		
		if (RMW) then
		{
			if ( RMiddle_WHEEL_STAT != 0 ) then
			{
				if (RMiddle_WHEEL_STAT >= 50 ) then
				{
					if ( RMiddle_WHEEL_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between50and80;
					};
				};
				if ( RMiddle_WHEEL_STAT < 50 ) then
				{
					if ( RMiddle_WHEEL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_below25;
					};
				};
			};	
		};	

		
		if (RF2W) then
		{
			if ( RForward2_WHEEL_STAT != 0 ) then
			{
				if (RForward2_WHEEL_STAT >= 50 ) then
				{
					if ( RForward2_WHEEL_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between50and80;
					};
				};
				if ( RForward2_WHEEL_STAT < 50 ) then
				{
					if ( RForward2_WHEEL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_below25;
					};
				};
			};
		};	
			
		
		if (LTCK) then
		{
			if ( Left_TRACK_STAT != 0 ) then
			{
				if ( Left_TRACK_STAT >= 50 ) then
				{
					if ( Left_TRACK_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_between50and80;
					};
				};
				if ( Left_TRACK_STAT < 50 ) then
				{
					if ( Left_TRACK_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_below25;
					};
				};
			};	
		};	

		
		if (RTCK) then
		{
			if ( Right_TRACK_STAT != 0 ) then
			{
				if ( Right_TRACK_STAT >= 50 ) then
				{
					if ( Right_TRACK_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_between50and80;
					};
				};
				if ( Right_TRACK_STAT < 50 ) then
				{
					if ( Right_TRACK_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_below25;
					};
				};
			};
		};
		
		
		if (TRET) then
		{
			if ( TURRET_STAT != 0 ) then
			{
				if ( TURRET_STAT >= 50 ) then
				{
					if ( TURRET_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Turret_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Turret_damage_between50and80;
					};
				};
				if ( TURRET_STAT < 50 ) then
				{
					if ( TURRET_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Turret_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Turret_damage_below25;
					};
				};
			};
		};
		
		
		if (GUN) then
		{
			if ( GUN_STAT != 0 ) then
			{
				if ( GUN_STAT >= 50 ) then
				{
					if ( GUN_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Gun_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Gun_damage_between50and80;
					};
				};
				if ( GUN_STAT < 50 ) then
				{
					if ( GUN_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Gun_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Gun_damage_below25;
					};
				};
			};
		};
		
		
		if (HULL) then
		{
			if ( HULL_STAT != 0 ) then
			{
				if ( HULL_STAT >= 50 ) then
				{
					if ( HULL_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Hull_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Hull_damage_between50and80;
					};
				};
				if ( HULL_STAT < 50 ) then
				{
					if ( HULL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Hull_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Hull_damage_below25;
					};
				};
			};
		};
		
		
		if (FUELL) then
		{
			if ( FUEL_STAT != 0 ) then
			{
				if ( FUEL_STAT >= 50 ) then
				{
					if ( FUEL_STAT > 80 ) then
					{
						Time_For_Repair = _Time_For_Repair + Fuel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Fuel_damage_between50and80;
					};
				};
				if ( FUEL_STAT < 50 ) then
				{
					if ( FUEL_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Fuel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Fuel_damage_below25;
					};
				};
			};
		};
		

		if (ENGI) then
		{
			if ( ENGINE_STAT != 0 ) then
			{
				if ( ENGINE_STAT >= 50 ) then
				{
					if ( ENGINE_STAT > 80 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Engine_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Engine_damage_between50and80;
					};
				};
				if ( ENGINE_STAT < 50 ) then
				{
					if ( ENGINE_STAT > 25 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Engine_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Engine_damage_below25;
					};
				};
			};
		};
		} // ********************************************************************************************************************************************************************
		else{ //Change if you want to see the state ********************************************************************************************************************************************************************
		if (LFW)then // ********************************************************************************************************************************************************************
		{
			if ( LForward_WHEEL_STAT != 100 ) then
			{
				if ( LForward_WHEEL_STAT <= 50 ) then
				{
					if ( LForward_WHEEL_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between50and80;
					};
				};
				if ( LForward_WHEEL_STAT > 50 ) then
				{
					if ( LForward_WHEEL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_below25;
					};
				};
			};
		};	
		
		
		if (LBW) then
		{
			if ( LBack_WHEEL_STAT != 100 ) then
			{
				if (LBack_WHEEL_STAT <= 50 ) then
				{
					if ( LBack_WHEEL_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between50and80;
					};
				};
				if ( LBack_WHEEL_STAT > 50 ) then
				{
					if ( LBack_WHEEL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_below25;
					};
				};
			};
		};	
		
		
		if (LMW) then
		{
			if ( LMiddle_WHEEL_STAT != 100 ) then
			{
				if (LMiddle_WHEEL_STAT <= 50 ) then
				{
					if ( LMiddle_WHEEL_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between50and80;
					};
				};
				if ( LMiddle_WHEEL_STAT > 50 ) then
				{
					if ( LMiddle_WHEEL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_below25;
					};
				};
			};
		};	
			

		if (LF2W) then
		{
			if ( LForward2_WHEEL_STAT != 100 ) then
			{
				if (LForward2_WHEEL_STAT <= 50 ) then
				{
					if ( LForward2_WHEEL_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between50and80;
					};
				};
				if ( LForward2_WHEEL_STAT > 50 ) then
				{
					if ( LForward2_WHEEL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_below25;
					};
				};
			};
		};	

		
		if (RFW) then
		{
			if ( RForward_WHEEL_STAT != 100 ) then
			{
				if (RForward_WHEEL_STAT <= 50 ) then
				{
					if ( RForward_WHEEL_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between50and80;
					};	
				};
				if ( RForward_WHEEL_STAT > 50 ) then
				{
					if ( RForward_WHEEL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_below25;
					};	
				};
			};
		};	
		
		
		if (RBW) then
		{
			if ( RBack_WHEEL_STAT != 100 ) then
			{
				if (RBack_WHEEL_STAT <= 50 ) then
				{
					if ( RBack_WHEEL_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between50and80;
					};
				};
				if ( RBack_WHEEL_STAT > 50 ) then
				{
					if ( RBack_WHEEL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Wheel_damage_below25;
					};
				};
			};
		};
		
		
		if (RMW) then
		{
			if ( RMiddle_WHEEL_STAT != 100 ) then
			{
				if (RMiddle_WHEEL_STAT <= 50 ) then
				{
					if ( RMiddle_WHEEL_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between50and80;
					};
				};
				if ( RMiddle_WHEEL_STAT > 50 ) then
				{
					if ( RMiddle_WHEEL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_below25;
					};
				};
			};	
		};	

		
		if (RF2W) then
		{
			if ( RForward2_WHEEL_STAT != 100 ) then
			{
				if (RForward2_WHEEL_STAT <= 50 ) then
				{
					if ( RForward2_WHEEL_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between50and80;
					};
				};
				if ( RForward2_WHEEL_STAT > 50 ) then
				{
					if ( RForward2_WHEEL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Secondary_Wheel_damage_below25;
					};
				};
			};
		};	
			
		
		if (LTCK) then
		{
			if ( Left_TRACK_STAT != 100 ) then
			{
				if ( Left_TRACK_STAT <= 50 ) then
				{
					if ( Left_TRACK_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_between50and80;
					};
				};
				if ( Left_TRACK_STAT > 50 ) then
				{
					if ( Left_TRACK_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_below25;
					};
				};
			};	
		};	

		
		if (RTCK) then
		{
			if ( Right_TRACK_STAT != 100 ) then
			{
				if ( Right_TRACK_STAT <= 50 ) then
				{
					if ( Right_TRACK_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_between50and80;
					};
				};
				if ( Right_TRACK_STAT > 50 ) then
				{
					if ( Right_TRACK_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Track_damage_below25;
					};
				};
			};
		};
		
		
		if (TRET) then
		{
			if ( TURRET_STAT != 100 ) then
			{
				if ( TURRET_STAT <= 50 ) then
				{
					if ( TURRET_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Turret_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Turret_damage_between50and80;
					};
				};
				if ( TURRET_STAT > 50 ) then
				{
					if ( TURRET_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Turret_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Turret_damage_below25;
					};
				};
			};
		};
		
		
		if (GUN) then
		{
			if ( GUN_STAT != 100 ) then
			{
				if ( GUN_STAT <= 50 ) then
				{
					if ( GUN_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Gun_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Gun_damage_between50and80;
					};
				};
				if ( GUN_STAT > 50 ) then
				{
					if ( GUN_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Gun_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Gun_damage_below25;
					};
				};
			};
		};
		
		
		if (HULL) then
		{
			if ( HULL_STAT != 100 ) then
			{
				if ( HULL_STAT <= 50 ) then
				{
					if ( HULL_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Hull_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Hull_damage_between50and80;
					};
				};
				if ( HULL_STAT > 50 ) then
				{
					if ( HULL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Hull_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Hull_damage_below25;
					};
				};
			};
		};
		
		
		if (FUELL) then
		{
			if ( FUEL_STAT != 100 ) then
			{
				if ( FUEL_STAT <= 50 ) then
				{
					if ( FUEL_STAT < 20 ) then
					{
						Time_For_Repair = _Time_For_Repair + Fuel_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Fuel_damage_between50and80;
					};
				};
				if ( FUEL_STAT > 50 ) then
				{
					if ( FUEL_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Fuel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Fuel_damage_below25;
					};
				};
			};
		};
		

		if (ENGI) then
		{
			if ( ENGINE_STAT != 100 ) then
			{
				if ( ENGINE_STAT <= 50 ) then
				{
					if ( ENGINE_STAT < 20 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Engine_damage_over80;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Engine_damage_between50and80;
					};
				};
				if ( ENGINE_STAT > 50 ) then
				{
					if ( ENGINE_STAT < 75 ) then
					{
						_Time_For_Repair = _Time_For_Repair + Engine_damage_between25and50;
					}
					else
					{
						_Time_For_Repair = _Time_For_Repair + Engine_damage_below25;
					};
				};
			};
		};
		};
		//countdown

		Repair_Time = _Time_For_Repair;
		call TAA_reparation_timer;
	}
	else
	{
		TAA_NO_TOOLKIT call TAA_text;
	};
};

TAA_reparation_timer =
{
	if (Reparationiscancelled) exitWith {};
	_Time_For_Countdown = 0;
	_Time_For_Countdown = Repair_Time;
	_Mins = 0;
	
	private ["_veh"];
	_veh = _this select 0;
	
	add3Exist = true;
	add3 = player addAction ["<t color=""#00FFFF"">" + "Stop Repair" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_stop"], 10, true, true, "", "true"];
	
	Reparationonstandby = false;
	//check is the repairation has been suspended 
	
	resumehasbeendone = true;
	//make stop the timer
	
	add5Exist = true;
	add5 = player addAction ["<t color=""#FF0000"">" + "Cancel Repair" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_cancel"], 4, true, true, "", "call TAA_cancel_conditions"];
	
	while { (_Time_For_Countdown) > 0 } do 
	{
		waitUntil {resumehasbeendone || Reparationiscancelled};//stop until reparation are resume or cancel action has been done 
		if (Reparationiscancelled) exitWith {};
		player playMoveNow "AinvPknlMstpSnonWnonDr_medic5";
		vehicleisbeingrepaired = true;
		//hide check and repair option while repairing
		_TimeDisplay = _Time_For_Countdown;
		if( _TimeDisplay > 59 ) then
		{
			_Mins = floor (_TimeDisplay / 60);
			_TimeDisplay = (_TimeDisplay % 60 );
		}
		else
		{
			_Mins = 0;
		};
		if ( _Mins > 0 ) then
		{
			if ( _TimeDisplay == 0 ) then
			{
				_TimeDisplay = _TimeDisplay + 60;
				_Mins = _Mins - 1;
			};
		};
		_TimeDisplay = _TimeDisplay - 1;
		hintsilent format["It Remains %2:%1 \nBefore the vehicle  \nIs fully repaired !",_TimeDisplay,_Mins];
		if (  _TimeDisplay < 10 ) then
		{
			hintsilent format["It Remains %2:0%1 \nBefore the vehicle  \nIs fully repaired !",_TimeDisplay,_Mins];
		};
		_Time_For_Countdown = _Time_For_Countdown - 1; //hidden countdown
		if(!add3Exist) then 
		{
			add3 = player addAction ["<t color=""#00FFFF"">" + "Stop Repair" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_stop"], 10, true, true, "", "true"];
			add3Exist = true;
		};
		if(!add5Exist) then 
		{
			add5 = player addAction ["<t color=""#FF0000"">" + "Cancel Repair" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_cancel"], 4, true, true, "", "call TAA_cancel_conditions"];
			add5Exist = true;
		};
		sleep 1.00;
	};
	if(add3Exist) then
	{
		player removeAction add3;
		add3Exist = false;
	};
	if (add5Exist) then
	{
		player removeAction add5;
		add5Exist = false;
	};
	vehiclehasbeencheck = false;
	if (Reparationiscancelled) exitWith {};
	player enableSimulation true;
	vehicleisbeingrepaired = false;
	hintsilent "The vehicle \nIs fully repaired \nGood Job !";
	_veh setDamage 0;
	sleep 3;
	hintsilent "";
};

TAA_standby_repairing =
{
	if (Reparationiscancelled) exitWith {};
	detection2 = nearestObjects [player, ["Car","Truck","Tank"], 8];
	add4Exist = true;
	add4 = player addAction ["<t color=""#00FF00"">" + "Resume Repair" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_resume"], 10, true, true, "", "true" ];
	TAA_STANDBY call TAA_text;
	hintsilent "";
	Reparationonstandby = true;
	resumehasbeendone = false;
	if(add3Exist) then
	{
		player removeAction add3;
		add3Exist = false;
	};
	while {true} do
	{
		if (Reparationiscancelled) exitWith {};
		_vehicle = ["B_MRAP_01_F"];
		detection = nearestObjects [player, ["Car","Truck","Tank"], 8];
		samevehicle = [detection,detection2] call BIS_fnc_areEqual;
		if (samevehicle && vehicle player == player && !resumehasbeendone  && !Reparationiscancelled) then
		{    
        	if(!add4Exist) then 
			{
				add4 = player addAction ["<t color=""#00FF00"">" + "Resume Repair" + "</t>", "TAA_Repair_script\TAA_repair_handle_action.sqf", ["action_resume"], 10, true, true, "","true"];
				add4Exist = true;
			};
		}
		else
		{
			if(add4Exist) then
			{
				player removeAction add4;
            	add4Exist = false;
			};
		};
		sleep 0.5;
	};
};

TAA_resume_reparation =
{
	if(add4Exist || Reparationiscancelled ) then
	{
		player removeAction add4;
        add4Exist = false;
	};
	if (add5Exist) then
	{
		player removeAction add5;
		add5Exist = false;
	};
	Reparationonstandby = false;
	resumehasbeendone = true;
	_Time_Until_Resume_Off = 300;		
};

TAA_cancel = 
{
	player removeAction add1;
	player removeAction add2;
	player removeAction add4;
	player removeAction add5;
	player removeAction add10;
	player removeAction add11;
	TAA_CANCELLED call TAA_text;
	Reparationiscancelled = true;
	[] execVM "TAA_Repair_script\TAA_Reload.sqf";
};

TAA_cancel_conditions =
{
	private ["_target"];
	_target = cursorTarget;
	_return = false;
	if ( !Reparationiscancelled && !resumehasbeendone  ) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};
	_return
};