class ACIM_DIALOG {
idd = -1;
movingenable = false;

	class Controls 
	{
		/*
		class acim_background_main: ACIM_MAIN_BOX
		{
			idc = 1800;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.44 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.12 * safezoneH;
		};*/
		class ACIM_button_01: ACIM_MAIN_BUTTON
		{
			idc = 01;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class ACIM_button_02: ACIM_MAIN_BUTTON
		{
			idc = 02;
			x = 0.5875 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class ACIM_button_03: ACIM_MAIN_BUTTON
		{
			idc = 03;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class ACIM_button_04: ACIM_MAIN_BUTTON
		{
			idc = 04;
			x = 0.5875 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class ACIM_button_05: ACIM_MAIN_BUTTON
		{
			idc = 05;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.6 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class ACIM_button_06: ACIM_MAIN_BUTTON
		{
			idc = 06;
			x = 0.3125 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class ACIM_button_07: ACIM_MAIN_BUTTON
		{
			idc = 07;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class ACIM_button_08: ACIM_MAIN_BUTTON
		{
			idc = 08;
			x = 0.3125 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class ACIM_backgroundText: ACIM_MAIN_TEXT
		{
			idc = 1000;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.12 * safezoneH;
			text = "ACIM";
			SizeEx = 0.2;
			colorText[] = {1,1,1,1};
			font = "puristaBold";
			shadow = 2;
			colorShadow[] = {0,0,0,1};
		};
		class ACIM_creditText: ACIM_MAIN_TEXT
		{
			idc = 1001;
			x = 0 * safezoneW + safezoneX;
			y = 0.98 * safezoneH + safezoneY;
			w = 0.9 * safezoneW;
			h = 0.02 * safezoneH;
			style = ST_LEFT;
			SizeEx = 0.03;
			text = "ADVANCED CIVILIAN INTERACTION MENU | VERSION: 0.02 | [AWC] CHIEF WIGGUM |";
			colorText[] = {0,0,0,0.5};
		};
	};
};

