class ACIM_ADMIN_MENU{
	idd = 0;
	movingenable = 1;
	onLoad = "execVM""CW_ACIM\Dialog\Scripts\acim_admin_menu_fill_combos.sqf"";[""HIDE_ALL""]execVM""CW_ACIM\Dialog\Scripts\acim_admin_menu_prep_dialog.sqf""";
	
	class Controls
	{
		class acim_admin_background_main: ACIM_ADMIN_BOX
		{
			idc = 1800;
			x = 0.0244791 * safezoneW + safezoneX;
			y = 0.401039 * safezoneH + safezoneY;
			w = 0.297917 * safezoneW;
			h = 0.549786 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			moving = 1;
		};
		class acim_admin_background_banner: ACIM_ADMIN_BOX
		{
			idc = 1801;
			x = 0.0244794 * safezoneW + safezoneX;
			y = 0.368051 * safezoneH + safezoneY;
			w = 0.297917 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			moving = 1;
		};
		class acim_admin_background_bannertext: ACIM_ADMIN_Text
		{
			idc = 1000;
			text = "ACIM ADMIN TOOL"; //--- ToDo: Localize;
			x = 0.121875 * safezoneW + safezoneX;
			y = 0.368051 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class acim_admin_button_close: ACIM_ADMIN_BUTTON
		{
			idc = 1600;
			text = "X"; //--- ToDo: Localize;
			x = 0.299479 * safezoneW + safezoneX;
			y = 0.368051 * safezoneH + safezoneY;
			w = 0.0171875 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBorder[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			shadow = 0
			colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			action = "closeDialog 0";
		};
		
		class acim_admin_background_text_selUnit: ACIM_ADMIN_Text
		{
			idc = 1001;
			text = "SELECT UNIT:"; //--- ToDo: Localize;
			x = 0.133333 * safezoneW + safezoneX;
			y = 0.42303 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorText[] = {1,0,0,1};
			colorBackground[] = {0,0,0,0};
		};
		class acim_admin_combo_selectUnit: ACIM_ADMIN_COMBO
		{
			idc = 2100;
			x = 0.0703125 * safezoneW + safezoneX;
			y = 0.456017 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,0,0,1};
			colorSelect[] = {1,0,0,1}; 
		};
		class acim_admin_background_text_selType: ACIM_ADMIN_Text
		{
			idc = 1002;
			text = "SELECT AN ACTION:"; //--- ToDo: Localize;
			x = 0.116146 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0,0,0};
		};
		class acim_admin_combo_selAction: ACIM_ADMIN_COMBO
		{
			idc = 2101;
			x = 0.0703125 * safezoneW + safezoneX;
			y = 0.532987 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,1,0,1};
			colorSelect[] = {0,1,0,1}; 
			onMouseButtonClick = "execVM ""CW_ACIM\Dialog\Scripts\acim_admin_menu_set_paratext.sqf""";
		};
		class acim_admin_backgroundtext_assingParams: ACIM_ADMIN_Text
		{
			idc = 1003;
			text = "ASSIGN PARAMETERS:"; //--- ToDo: Localize;
			x = 0.110417 * safezoneW + safezoneX;
			y = 0.57697 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorText[] = {0,0.667,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class acim_admin_backgroundtext_param1: ACIM_ADMIN_Text
		{
			idc = 1004;
			x = 0.133333 * safezoneW + safezoneX;
			y = 0.620953 * safezoneH + safezoneY;
			w = 0.0744792 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			style = ST_CENTER;
		};
		class acim_admin_backgroundtext_param2: ACIM_ADMIN_Text
		{
			idc = 1005;
			x = 0.133333 * safezoneW + safezoneX;
			y = 0.675931 * safezoneH + safezoneY;
			w = 0.0744792 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			style = ST_CENTER;
		};
		class acim_admin_backgroundtext_param3: ACIM_ADMIN_Text
		{
			idc = 1006;
			x = 0.133333 * safezoneW + safezoneX;
			y = 0.73091 * safezoneH + safezoneY;
			w = 0.0744792 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			style = ST_CENTER;
		};
		class acim_admin_backgroundtext_param4: ACIM_ADMIN_Text
		{
			idc = 1007;
			x = 0.133333 * safezoneW + safezoneX;
			y = 0.785888 * safezoneH + safezoneY;
			w = 0.0744792 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			style = ST_CENTER;
		};
		class acim_admin_backgroundtext_param5: ACIM_ADMIN_Text
		{
			idc = 1008;
			text = "PARAM5"; 
			x = 0.133333 * safezoneW + safezoneX;
			y = 0.840867 * safezoneH + safezoneY;
			w = 0.0744792 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			style = ST_CENTER;			
		};
		class acim_admin_edit_param1: ACIM_ADMIN_EDID
		{
			idc = 1400;
			x = 0.0645833 * safezoneW + safezoneX;
			y = 0.642944 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class acim_admin_edit_param2: ACIM_ADMIN_EDID
		{
			idc = 1401;
			x = 0.0645833 * safezoneW + safezoneX;
			y = 0.697923 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class acim_admin_edit_param3: ACIM_ADMIN_EDID
		{
			idc = 1402;
			x = 0.0645833 * safezoneW + safezoneX;
			y = 0.752901 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class acim_admin_edit_param4: ACIM_ADMIN_EDID
		{
			idc = 1403;
			x = 0.0645833 * safezoneW + safezoneX;
			y = 0.80788 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0329871 * safezoneH;
		};				
		class acim_admin_edit_param5: ACIM_ADMIN_EDID
		{
			idc = 1404;
			x = 0.0645833 * safezoneW + safezoneX;
			y = 0.862858 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class acim_button_go: ACIM_ADMIN_BUTTON
		{
			idc = 1601;
			text = "GO!"; //--- ToDo: Localize;
			x = 0.288021 * safezoneW + safezoneX;
			y = 0.906841 * safezoneH + safezoneY;
			w = 0.0286458 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {0,1,0,1};
			colorBackgroundActive[] = {0,1,0,1};
			colorText[] = {1,1,1,1};
			action = "execvM ""CW_ACIM\Scripts\User\acim_admin_go.sqf""";
		};
	};
};






