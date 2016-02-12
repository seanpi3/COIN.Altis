class ACIM_Info{
	
	idd = -1;
	movingenabe = true;
	onLoad = "_this ExecVM 'CW_ACIM\Dialog\Scripts\settext.sqf';_this ExecVM 'CW_ACIM\Dialog\Scripts\checkziv.sqf'"; 
	
	class ControlsBackground
	{
		class background_main: ACIMPicture
		{
			idc = 1202;
			text = "CW_ACIM\Images\perso_background.paa";
			x = 0.236458 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.509167 * safezoneW;
			h = 0.703726 * safezoneH;
			moving = 1;
		};
		class header_name: ACIMInfoTextHeader
		{
			idc = 1000;
			text = "$STR_CW_ACIM_ID_NAME"; 
			x = 0.48 * safezoneW + safezoneX;
			y = 0.335064 * safezoneH + safezoneY;
			w = 0.35 * safezoneW;
			h = 0.0219914 * safezoneH;
			moving = 1;
		};
		class header_birthdate: ACIMInfoTextHeader
		{
			idc = 1001;
			text = "$STR_CW_ACIM_ID_AGE";
			x = 0.48 * safezoneW + safezoneX;
			y = 0.390043 * safezoneH + safezoneY;
			w = 0.2699917 * safezoneW;
			h = 0.0219914 * safezoneH;
			moving = 1;
		};
		class header_placeofbirth: ACIMInfoTextHeader
		{
			idc = 1002;
			text = "$STR_CW_ACIM_ID_POB";
			x = 0.48 * safezoneW + safezoneX;
			y = 0.445021 * safezoneH + safezoneY;
			w = 0.2692917 * safezoneW;
			h = 0.0219914 * safezoneH;
			moving = 1;
		};
		class header_expiry: ACIMInfoTextHeader
		{
			idc = 1003;
			text = "$STR_CW_ACIM_ID_VALIDITY";
			x = 0.48 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.2695625 * safezoneW;
			h = 0.0219914 * safezoneH;
			moving = 1;
		};
		class header_signature: ACIMInfoTextHeader
		{
			idc = 1004;
			text = "$STR_CW_ACIM_ID_SIGNATURE";
			x = 0.48 * safezoneW + safezoneX;
			y = 0.543983 * safezoneH + safezoneY;
			w = 0.2790208 * safezoneW;
			h = 0.0329871 * safezoneH;
			moving = 1;
		};
	};
	class Controls
	{
		class name: ACIMInfoText
		{
			idc = 1005;
			text = "ERROR"; //--- ToDo: Localize;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.357056 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class dateofbirth: ACIMInfoText
		{
			idc = 1006;
			text = "ERROR"; //--- ToDo: Localize;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.412034 * safezoneH + safezoneY;
			w = 0.2992083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class placeofbirth: ACIMInfoText
		{
			idc = 1007;
			text = "ERROR"; //--- ToDo: Localize;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.467013 * safezoneH + safezoneY;
			w = 0.2992083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class expiry: ACIMInfoText
		{
			idc = 1008;
			text = "26.07.2036"; //--- ToDo: Localize;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.521991 * safezoneH + safezoneY;
			w = 0.2872083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class close_Button: ACIMButtonInfo
		{
			idc = 1009;
			text = "X"; //--- ToDo: Localize;
			x = 0.620313 * safezoneW + safezoneX;
			y = 0.313073 * safezoneH + safezoneY;
			w = 0.0194583 * safezoneW;
			h = 0.0219914 * safezoneH;
			action = "closeDialog 0";
		};
	};
};
