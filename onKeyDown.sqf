_code = _this select 1;
if (_code in (actionKeys "User10")) then {
		if (earplugs) then {
			0 fadeSound 1;
			titleText["Earplugs removed.","PLAIN"];
			earplugs = false;
		}
		else {
			0 fadeSound 0.2;
			titleText["Earplugs inserted.","PLAIN"];
			earplugs = true;
		};
};

if (_code in (actionKeys "User11")) then {
		if(adrenalineShots > 0) then
		{		
			adrenalineShotStart = time;
			titleText["You comsumed a redgull.","PLAIN"];
			player setFatigue 0;
			player enableFatigue false;
			adrenalineShots = adrenalineShots - 1;
			systemChat format["You now have %1 adrenaline shot(s)",adrenalineShots];
			[] spawn
			{
				waitUntil {!alive player || (time - adrenalineShotStart) > (60)};
				player enableFatigue true;
			};
		}
		else{
			titleText["You have no more adrenaline shots.","PLAIN"];
		};
		_handled = true;
	};
	
switch(_code) do{
	case 35: {
		if(!(currentWeapon player == "")) then {
			currWeap = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};
		if(!(currWeap == "")) then {
				player selectWeapon currWeap;
		};
	};
};