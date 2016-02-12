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
*/
_curVol = player getVariable "acim_curVol";



If (_curVol == ACIM_MaxWhisperDistance) exitWith 
	{
		player setVariable ["acim_curVol", ACIM_MaxNormalDistance, true];
		hint format ["ACIM-SPEACH VOLUME SET TO:\nnormal (%1m)", ACIM_MaxNormalDistance];
	};

If (_curVol == ACIM_MaxNormalDistance) exitWith 
	{
		player setVariable ["acim_curVol", ACIM_MaxYellingDistance, true];
		hint format ["ACIM-SPEACH VOLUME SET TO:\nyelling (%1m)", ACIM_MaxYellingDistance];
	};

If (_curVol == ACIM_MaxYellingDistance) exitWith 
	{
		player setVariable ["acim_curVol", ACIM_MaxWhisperDistance, true];
		hint format ["ACIM-SPEACH VOLUME SET TO:\nwhisper (%1m)", ACIM_MaxWhisperDistance];
	};


