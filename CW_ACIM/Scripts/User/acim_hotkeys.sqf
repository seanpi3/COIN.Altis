/*		 ___			  ____________		 ___       ___           ___
		/   \			 |            |		|	|	  |	  \         /   |
	   /     \			 |    ________|		|	|	  |	   \       /	|
	  /		  \		 	 |   |				|	|	  |     \     /		|
	 /	 / \   \		 |   |				|	|	  |  |\  \___/	/|	|
	/   /___\   \		 |   |				|	|	  |	 | \	   / |	|
   /   _______   \	   	 |   |				|	|	  |	 |  \_____/	 |	|
  /   /       \   \		 |   |_________		|	|	  |	 |			 |	|
 /   /         \   \	 |             |	|	|	  |	 |			 |	|
/___/           \___\	 |_____________|	|___|	  |__|			 |__|
by: Chief Wiggum
www.awc-gaming.de

file: acim_hotkeys.sqf

Description:	
Hotkey stuff...
*/
private "_keycheck";




_keycheck = true;

while {_keycheck} do
{

//STOP HOTKEY (User1)
If (inputAction "User1" > 0 ) then {[[[player], "CW_ACIM\Scripts\Movement\stop.sqf"], "BIS_fnc_execVM", false,false,true ] call BIS_fnc_MP;	_keycheck = false; sleep 1.5; _keycheck = true};

//GO HOTKEY (User2)
If (inputAction "User2" > 0 ) then {[[[player], "CW_ACIM\Scripts\Movement\go.sqf"], "BIS_fnc_execVM", false,false,true ] call BIS_fnc_MP; _keycheck = false; sleep 1.5; _keycheck = true};

//GET DOWN HOTKEY (User 3)
If (inputAction "User3" > 0 ) then {[[[player], "CW_ACIM\Scripts\Movement\getdown.sqf"], "BIS_fnc_execVM", false,false,true ] call BIS_fnc_MP; _keycheck = false; sleep 1.5; _keycheck = true};

//GET UP HOTKEY (User 4)
If (inputAction "User4" > 0 ) then {[[[player], "CW_ACIM\Scripts\Movement\getup.sqf"], "BIS_fnc_execVM", false,false,true ] call BIS_fnc_MP; _keycheck = false; sleep 1.5; _keycheck = true};

//SPEECH VOLUME SET HOTKEY (User 5)
If (inputAction "User5" > 0 ) then {[] execVM "CW_ACIM\Scripts\User\speech_volume.sqf";_keycheck = false; sleep 0.5; _keycheck = true};

//OPEN ACIM (User 6)
If (inputAction "User6" > 0 ) then {createDialog "ACIM";};

};
