//Speech-Volume setup
ACIM_MaxWhisperDistance = 5; 	//"whisper" radius (in meters)			default: 5m
ACIM_MaxNormalDistance = 10;	//"normal" radius  (in meters)			default: 10m
ACIM_MaxYellingDistance = 20;	//"yelling" radius (in meters)			default: 20m
//-----
player setVariable ["acim_curVol", ACIM_MaxNormalDistance, true]; //default Speech-Volume
//---------------------------------------------------------------------------------


//add	//	at the begin of the line below, in order to diasable the mousewheel option for ACIM.
acim_actionmenu_entry = PLAYER addaction ["<t color='#AA00FF'>ACIM",{["MAIN"] call ACIM_fnc_createDialog;},nil,1,true,true,"User6","player == vehicle player OR player != driver vehicle player"];
//---------------------------------------------------------------------------------



ACIM_Grayout = true;	//gray out unusable Buttons		default: true //OUTDATED!!!!!!!!!!!!!!!!!!!!!!!
//---------------------------------------------------------------------------------

//Respawn Eventhandler
player addEventHandler ["Respawn", {_this execVM "CW_ACIM\Configuration\acim_setup.sqf"}];



//IGNORE ALL SHIT BELOW HERE! :D
ACIM_Player_INV = [];

acim_player_is_searching = false;

ACIM_INVENTORY_ITEMNAMES = 
[
(localize "STR_CW_ACIM_FINDS_Nothing"),			
(localize "STR_CW_ACIM_FINDS_Morphine"),			
(localize "STR_CW_ACIM_FINDS_Cloth"),		
(localize "STR_CW_ACIM_FINDS_Duct Tape"),			
(localize "STR_CW_ACIM_FINDS_Toolbox"),		
(localize "STR_CW_ACIM_FINDS_Scrap Metal"),		
(localize "STR_CW_ACIM_FINDS_Note"),					
(localize "STR_CW_ACIM_FINDS_Mortar Shell"), 		
(localize "STR_CW_ACIM_FINDS_Money"),			
(localize "STR_CW_ACIM_FINDS_Knife"),			
(localize "STR_CW_ACIM_FINDS_Water Bottle"),		
(localize "STR_CW_ACIM_FINDS_Canned Food"),			
(localize "STR_CW_ACIM_FINDS_C4 Explosive"),			
(localize "STR_CW_ACIM_FINDS_Cookbook"),				
(localize "STR_CW_ACIM_FINDS_Baseball"),			
(localize "STR_CW_ACIM_FINDS_Battery"),				
(localize "STR_CW_ACIM_FINDS_Bible"),			
(localize "STR_CW_ACIM_FINDS_Book"), 			
(localize "STR_CW_ACIM_FINDS_Car Battery"),			
(localize "STR_CW_ACIM_FINDS_Potato Chips"),			
(localize "STR_CW_ACIM_FINDS_Box of Cigars"), 		
(localize "STR_CW_ACIM_FINDS_Cigarettes"),		
(localize "STR_CW_ACIM_FINDS_Clipboard"),			
(localize "STR_CW_ACIM_FINDS_Cooked Meat"),			
(localize "STR_CW_ACIM_FINDS_Dogtag"),				
(localize "STR_CW_ACIM_FINDS_Folded Map"),			
(localize "STR_CW_ACIM_FINDS_Hard Drive"), 		
(localize "STR_CW_ACIM_FINDS_Harmonica"), 			
(localize "STR_CW_ACIM_FINDS_Lighter"), 				
(localize "STR_CW_ACIM_FINDS_Penicillin"),			
(localize "STR_CW_ACIM_FINDS_Raw Meat"), 		
(localize "STR_CW_ACIM_FINDS_Rock"),					
(localize "STR_CW_ACIM_FINDS_SD Card"), 			
(localize "STR_CW_ACIM_FINDS_Soda Can"),				
(localize "STR_CW_ACIM_FINDS_Teddy Bear"),			
(localize "STR_CW_ACIM_FINDS_Tin Can"),				
(localize "STR_CW_ACIM_FINDS_USB Drive"),			
(localize "STR_CW_ACIM_FINDS_Wallet"),				
(localize "STR_CW_ACIM_FINDS_Whiskey"), 				
(localize "STR_CW_ACIM_FINDS_Can of Paint"), 		
(localize "STR_CW_ACIM_FINDS_Candy Bar"), 			
(localize "STR_CW_ACIM_FINDS_Beer"), 				
(localize "STR_CW_ACIM_FINDS_Boltcutter"),			
(localize "STR_CW_ACIM_FINDS_Carrot"), 				
(localize "STR_CW_ACIM_FINDS_Cereal"), 				
(localize "STR_CW_ACIM_FINDS_Coffee"),				
(localize "STR_CW_ACIM_FINDS_Corn"),					
(localize "STR_CW_ACIM_FINDS_Dino Toy"),			
(localize "STR_CW_ACIM_FINDS_Dirty Water"),			
(localize "STR_CW_ACIM_FINDS_Energy Drink"),			
(localize "STR_CW_ACIM_FINDS_Gum"),				
(localize "STR_CW_ACIM_FINDS_Hammer"), 				
(localize "STR_CW_ACIM_FINDS_Keycard"), 				
(localize "STR_CW_ACIM_FINDS_Moonshine"),		
(localize "STR_CW_ACIM_FINDS_Nails"),  			
(localize "STR_CW_ACIM_FINDS_Potato"),				
(localize "STR_CW_ACIM_FINDS_Razor"),				
(localize "STR_CW_ACIM_FINDS_Sandbag"), 				
(localize "STR_CW_ACIM_FINDS_Sugar"), 				
(localize "STR_CW_ACIM_FINDS_Wrench"), 				
(localize "STR_CW_ACIM_FINDS_Donut"),				
(localize "STR_CW_ACIM_FINDS_Empty Bottle"),			
(localize "STR_CW_ACIM_FINDS_Gas Mask"),				
(localize "STR_CW_ACIM_FINDS_Laptop"),				
(localize "STR_CW_ACIM_FINDS_Rope"), 				
(localize "STR_CW_ACIM_FINDS_Snoballs"),		
(localize "STR_CW_ACIM_FINDS_Tablet"),			
(localize "STR_CW_ACIM_FINDS_Twinkies")	
];	

ACIM_INVENTORY_TEMP_USEDITEMNAMES_SHIRT = [];
ACIM_INVENTORY_TEMP_USEDITEMNAMES_SHOES = [];
ACIM_INVENTORY_TEMP_USEDITEMNAMES_PANTS = [];
ACIM_INVENTORY_TEMP_USEDITEMNAMES_VEST = [];
ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK = [];
ACIM_INVENTORY_TEMP_USEDITEMNAMES = ACIM_INVENTORY_TEMP_USEDITEMNAMES_SHIRT + ACIM_INVENTORY_TEMP_USEDITEMNAMES_SHOES + ACIM_INVENTORY_TEMP_USEDITEMNAMES_PANTS + ACIM_INVENTORY_TEMP_USEDITEMNAMES_VEST + ACIM_INVENTORY_TEMP_USEDITEMNAMES_BACKPACK;


hint "ACIM Setup completed";