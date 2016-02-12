class ACIM_INVENTORY 
{
	idd = -1;
	movingenable = true;
	onLoad = "execVM ""CW_ACIM\Dialog\Scripts\fill_inv_listbox.sqf""";
	
	class Controls
	{
		class ACIM_INV_BACKGROUND_MAIN: ACIM_INV_BOX
		{
			idc = 1800;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.598961 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.395846 * safezoneH;
			moving = 1;
		};
		class ACIM_INV_LISTB_CIVINV: ACIM_INV_LISTBOX
		{
			idc = 1500;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.642944 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.318876 * safezoneH;
		};
		class ACIM_INV_LISTB_PLAYERINV: ACIM_INV_LISTBOX
		{
			idc = 1501;
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.642944 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.318876 * safezoneH;
		};
		class ACIM_INV_BUTTON_TAKE: ACIM_INV_BUTTON
		{
			idc = 1600;
			text = "$STR_CW_ACIM_TAKE"; 
			x = 0.414063 * safezoneW + safezoneX;
			y = 0.642944 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.0439828 * safezoneH;
			action = "[""TAKE""] call acim_fnc_handle_ACIM_INV";
		};
		class CW_ACIM_BUTTON_GIVE: ACIM_INV_BUTTON
		{
			idc = 1601;
			text = "$STR_CW_ACIM_GIVE"; 
			x = 0.517188 * safezoneW + safezoneX;
			y = 0.917837 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.0439828 * safezoneH;
			action = "[""GIVE""] call acim_fnc_handle_ACIM_INV";
		};
		class ACIM_INV_BACKGROUND_ACIMTEXT: ACIM_INV_TEXT
		{
			idc = 1000;
			text = "ACIM"; 
			x = 0.419792 * safezoneW + safezoneX;
			y = 0.677923 * safezoneH + safezoneY;
			w = 0.160417 * safezoneW;
			h = 0.15394 * safezoneH;
			SizeEx = 0.2;
			colorText[] = {1,1,1,1};
			font = "puristaBold";
			shadow = 2;
			colorShadow[] = {0,0,0,1};
		};
		class CIM_INV_BACKGROUND_TEXT_CIVINV: ACIM_INV_TEXT
		{
			idc = 1001;
			text = "$STR_CW_ACIM_CIVINV"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.609957 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0329871 * safezoneH;
			style = ST_LEFT;
		};
		class CIM_INV_BACKGROUND_TEXT_YOURINV: ACIM_INV_TEXT
		{
			idc = 1002;
			text = "$STR_CW_ACIM_YOURINV"; 
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.609957 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0329871 * safezoneH;
			style = ST_RIGHT;
		};
		class _CLOSE: ACIM_INV_BUTTON
		{
			idc = 1602;
			text = "$STR_CW_ACIM_CLOSE"; 
			x = 0.477083 * safezoneW + safezoneX;
			y = 0.851863 * safezoneH + safezoneY;
			w = 0.0601042 * safezoneW;
			h = 0.0329871 * safezoneH;
			action = "closeDialog 0";
		};
	};
};