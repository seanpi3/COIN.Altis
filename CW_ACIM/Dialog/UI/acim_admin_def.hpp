#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

class ACIM_ADMIN_BOX
{ 
   type = CT_STATIC;
	idc = -1;
	style = ST_CENTER;
	shadow = 2;
	colorText[] = {1,1,1,1};
	font = "puristaMedium";
	sizeEx = 0.02;
	colorBackground[] = {1,1,1,1};
	text = ""; 
};
class ACIM_ADMIN_Text
{
   access = 0;
   type = 0;
   idc = -1;
   colorBackground[] = {0,0,0,0.7};
   colorText[] = {1,1,1,1};
   text = "";
   fixedWidth = 0;
   x = 0;
   y = 0;
   h = 0.037;
   w = 0.3;
   style = 0;
   shadow = 2;
   font = "puristaMedium";
   SizeEx = 0.03921;
};
class ACIM_ADMIN_BUTTON
{
   access = 0;
   type = 1;
   text = "";
   colorText[] = {1,1,1,1};
   colorDisabled[] = {0,0,0,1};
   colorBackground[] = {0,0,0,1};
   colorBackgroundDisabled[] = {0,0,0,1};
   colorBackgroundActive[] = {0,0,0,1};
   colorFocused[] = {0,0,0,1};
   colorShadow[] = {0.023529,0,0.0313725,1};
   colorBorder[] = {0,0,0,0};
   soundEnter[] = {"",0.09,1};
   soundPush[] = {"",0,0};
   soundClick[] = {"",0.07,1};
   soundEscape[] = {"",0.09,1};
   style = 2;
   x = 0;
   y = 0;
   w = 0.095589;
   h = 0.039216;
   shadow = 2;
   font = "puristaMedium";
   sizeEx = 0.03921;
   offsetX = 0.003;
   offsetY = 0.003;
   offsetPressedX = 0.002;
   offsetPressedY = 0.002;
   borderSize = 0;
};
/*
class ACIM_ADMIN_COMBO
		{
			access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = CT_COMBO; // Control identification (without it, the control won't be displayed)
			type = CT_COMBO; // Type
			style = ST_LEFT + LB_TEXTURES; // Style
			default = 0; // Control selected by default (only one within a display can be used)
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

			x = -1;
			y = -1;
			w = -1;
			h = -1;

			colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
			colorSelectBackground[] = {1,1,1,1}; // Selected item fill color

			sizeEx = GUI_GRID_CENTER_H; // Text size
			font = GUI_FONT_NORMAL; // Font from CfgFontFamilies
			shadow = 0; // Shadow (0 - none, 1 - N/A, 2 - black outline)
			colorText[] = {1,1,1,1}; // Text and frame color
			colorDisabled[] = {1,1,1,0.5}; // Disabled text color
			colorSelect[] = {1,1,1,1}; // Text selection color

			pictureColor[] = {1,0,0,1}; // Picture color
			pictureColorSelect[] = {0,0,0,1}; // Selected picture color
			pictureColorDisabled[] = {0,0,0,1}; // Disabled picture color

			tooltip = ""; // Tooltip text
			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa"; // Expand arrow
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa"; // Collapse arrow

			wholeHeight = 5 * GUI_GRID_CENTER_H; // Maximum height of expanded box (including the control height)
			maxHistoryDelay = 1; // Time since last keyboard type search to reset it

			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1}; // Sound played when the list is expanded
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1}; // Sound played when the list is collapsed
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1}; // Sound played when an item is selected

			// Scrollbar configuration (applied only when LB_TEXTURES style is used)
			class ComboScrollBar
			{
				width = 0; // Unknown?
				height = 0; // Unknown?
				scrollSpeed = 0.01; // Unknown?

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color
			};
*/
class ACIM_ADMIN_COMBO
{
	access = 0;
	type = 4;
	colorSelect[] =
	{
		0,
		0,
		0,
		1
	};
	colorText[] =
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorBackground[] =
	{
		0,
		0,
		0,
		1
	};
	colorScrollbar[] =
	{
		1,
		0,
		0,
		1
	};
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	soundExpand[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	maxHistoryDelay = 1;
	class ScrollBar
	{
		color[] =
		{
			1,
			1,
			1,
			0.6
		};
		colorActive[] =
		{
			0,
			0,
			0,
			0
		};
		colorDisabled[] =
		{
			1,
			1,
			1,
			0.3
		};
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	style = 16;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelectBackground[] =
	{
		1,
		1,
		1,
		0.7
	};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] =
	{
		1,
		1,
		1,
		1
	};
	colorActive[] =
	{
		1,
		0,
		0,
		1
	};
	colorDisabled[] =
	{
		1,
		1,
		1,
		0.25
	};
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	// Scrollbar configuration (applied only when LB_TEXTURES style is used)
			class ComboScrollBar
			{
				width = 0; // Unknown?
				height = 0; // Unknown?
				scrollSpeed = 0.01; // Unknown?

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color
			};
};		
class ACIM_ADMIN_EDID
		{
	access = 0; 
	type = CT_EDIT; 
	style = ST_LEFT+ST_FRAME; 
	x = 0; 
	y = 0; 
	h = 0.04; 
	w = 0.2; 
	colorBackground[] = {1,0,0,1}; 
	colorText[] = {0.804,0.773,0.749,1}; 
	colorSelection[] = {1,1,1,0.25}; 
	colorDisabled[] = {1, 1, 1, 0.500000};
	font = "TahomaB"; 
	sizeEx = 0.04; 
	autocomplete = ""; 
	text = "";
	size = 0.2; 
	shadow = 0;
};
		