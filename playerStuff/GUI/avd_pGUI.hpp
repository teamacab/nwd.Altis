class avd_pGUI
{
	idd = -1;
	movingEnable = false;
	onLoad = "playerGUIopen = 1;[player]execVM ""playerStuff\GUI\GUIactions\playerCheck_GUI.sqf""";
	onUnload = "playerGUIopen = 0";

	#define GUI_GRID_X	(0)
	#define GUI_GRID_Y	(0)
	#define GUI_GRID_W	(0.025)
	#define GUI_GRID_H	(0.04)
	#define GUI_GRID_WAbs	(1)
	#define GUI_GRID_HAbs	(1)

	controls[]=
	{
		avd_pGUI_back,
		avd_pGUI_frame_main,
		avd_pGUI_btn_close,
		avd_pGUI_btn_fireplace,
		avd_pGUI_btn_cook,
		avd_pGUI_btn_fillBottle,
		avd_pGUI_btn_eat,
		avd_pGUI_btn_ahabgame,
		avd_pGUI_frame_skill,
		avd_pGUI_txt_skill,
		avd_pGUI_frame_tools,
		avd_pGUI_txt_lighter,
		avd_pGUI_txt_knife,
		avd_pGUI_chk_lighter,
		avd_pGUI_chk_knife,
		avd_pGUI_frame_fooddrink,
		avd_pGUI_txt_food,
		avd_pGUI_txt_cash,
		avd_pGUI_txt_drink,
		avd_pGUI_txt_chk_food,
		avd_pGUI_txt_chk_drink,
		avd_pGUI_txt_chk_cash,
		avd_pGUI_txt_sleepingbag,
		avd_pGUI_chk_sleepingbag,
		avd_pGUI_txt_toolkit,
		avd_pGUI_txt_medikit,
		avd_pGUI_txt_waterB,
		avd_pGUI_chk_toolkit,
		avd_pGUI_chk_medikit,
		avd_pGUI_chk_waterB,
		avd_pGUI_btn_camp
	};

	class avd_pGUI_back: IGUIBack
	{
		idc = 2200;
		x = 2 * GUI_GRID_W + GUI_GRID_X;
		y = 0 * GUI_GRID_H + GUI_GRID_Y;
		w = 36 * GUI_GRID_W;
		h = 11.5 * GUI_GRID_H;
	};
	class avd_pGUI_frame_main: RscFrame
	{
		idc = 1800;
		text = "Player Menu"; //--- ToDo: Localize;
		x = 2 * GUI_GRID_W + GUI_GRID_X;
		y = 0 * GUI_GRID_H + GUI_GRID_Y;
		w = 36 * GUI_GRID_W;
		h = 11.5 * GUI_GRID_H;
	};
	class avd_pGUI_btn_close: RscButton
	{
		idc = 1606;
		text = "Close"; //--- ToDo: Localize;
		action = "closeDialog 0";
		x = 32.5 * GUI_GRID_W + GUI_GRID_X;
		y = 10.25 * GUI_GRID_H + GUI_GRID_Y;
		w = 4 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_btn_fireplace: RscButton
	{
		idc = 1600;
		text = "Create Fireplace"; //--- ToDo: Localize;
		action = "execVM ""playerStuff\GUI\GUIactions\createFire.sqf""";
		x = 3 * GUI_GRID_W + GUI_GRID_X;
		y = 1 * GUI_GRID_H + GUI_GRID_Y;
		w = 8 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_btn_cook: RscButton
	{
		idc = 1601;
		text = "Cook Meat"; //--- ToDo: Localize;
		action = "execVM ""playerStuff\GUI\GUIactions\cookMeat.sqf""";
		x = 3 * GUI_GRID_W + GUI_GRID_X;
		y = 4 * GUI_GRID_H + GUI_GRID_Y;
		w = 8 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_btn_fillBottle: RscButton
	{
		idc = 1602;
		text = "Fill Waterbottle"; //--- ToDo: Localize;
		action = "execVM ""playerStuff\GUI\GUIactions\fillBottle.sqf""";
		x = 3 * GUI_GRID_W + GUI_GRID_X;
		y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 8 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_btn_eat: RscButton
	{
		idc = 1603;
		text = "Eat/Drink"; //--- ToDo: Localize;
		action = "closeDialog 0; createDialog ""avd_foodGUI""";
		x = 3 * GUI_GRID_W + GUI_GRID_X;
		y = 7 * GUI_GRID_H + GUI_GRID_Y;
		w = 8 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_btn_ahabgame: RscButton
	{
		idc = 1604;
		text = "Ahab Game"; //--- ToDo: Localize;
		action = "closeDialog 0";
		x = 3 * GUI_GRID_W + GUI_GRID_X;
		y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 8 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_frame_skill: RscFrame
	{
		idc = 1801;
		text = "Skill"; //--- ToDo: Localize;
		x = 25 * GUI_GRID_W + GUI_GRID_X;
		y = 1 * GUI_GRID_H + GUI_GRID_Y;
		w = 12 * GUI_GRID_W;
		h = 2.5 * GUI_GRID_H;
	};
	class avd_pGUI_txt_skill: RscText
	{
		idc = 1000;
		text = "Skill"; //--- ToDo: Localize;
		x = 25.5 * GUI_GRID_W + GUI_GRID_X;
		y = 2 * GUI_GRID_H + GUI_GRID_Y;
		w = 11 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_frame_tools: RscFrame
	{
		idc = 1802;
		text = "Tools"; //--- ToDo: Localize;
		x = 12.5 * GUI_GRID_W + GUI_GRID_X;
		y = 1 * GUI_GRID_H + GUI_GRID_Y;
		w = 11.5 * GUI_GRID_W;
		h = 9 * GUI_GRID_H;
	};
	class avd_pGUI_txt_lighter: RscText
	{
		idc = 1004;
		text = "Lighter"; //--- ToDo: Localize;
		x = 13.5 * GUI_GRID_W + GUI_GRID_X;
		y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_txt_knife: RscText
	{
		idc = 1005;
		text = "Knife"; //--- ToDo: Localize;
		x = 13.5 * GUI_GRID_W + GUI_GRID_X;
		y = 3 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_chk_lighter: RscPicture
	{
		idc = 1200;
		text = "#(argb,8,8,3)color(1,0,0,1)";
		x = 21.5 * GUI_GRID_W + GUI_GRID_X;
		y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 1.25 * GUI_GRID_W;
		h = 0.75 * GUI_GRID_H;
	};
	class avd_pGUI_chk_knife: RscPicture
	{
		idc = 1201;
		text = "#(argb,8,8,3)color(1,0,0,1)";
		x = 21.5 * GUI_GRID_W + GUI_GRID_X;
		y = 3 * GUI_GRID_H + GUI_GRID_Y;
		w = 1.25 * GUI_GRID_W;
		h = 0.75 * GUI_GRID_H;
	};
	class avd_pGUI_frame_fooddrink: RscFrame
	{
		idc = 1803;
		text = "Stats"; //--- ToDo: Localize;
		x = 25 * GUI_GRID_W + GUI_GRID_X;
		y = 4 * GUI_GRID_H + GUI_GRID_Y;
		w = 12 * GUI_GRID_W;
		h = 6 * GUI_GRID_H;
	};
	class avd_pGUI_txt_food: RscText
	{
		idc = 1006;
		text = "Food"; //--- ToDo: Localize;
		x = 25.5 * GUI_GRID_W + GUI_GRID_X;
		y = 5 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_txt_cash: RscText
	{
		idc = 1011;
		text = "Cash"; //--- ToDo: Localize;
		x = 25.5 * GUI_GRID_W + GUI_GRID_X;
		y = 8 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_txt_drink: RscText
	{
		idc = 1007;
		text = "Drink"; //--- ToDo: Localize;
		x = 25.5 * GUI_GRID_W + GUI_GRID_X;
		y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_txt_chk_food: RscText
	{
		idc = 1008;
		text = "zahl"; //--- ToDo: Localize;
		x = 34 * GUI_GRID_W + GUI_GRID_X;
		y = 5 * GUI_GRID_H + GUI_GRID_Y;
		w = 2 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_txt_chk_drink: RscText
	{
		idc = 1009;
		text = "zahl"; //--- ToDo: Localize;
		x = 34 * GUI_GRID_W + GUI_GRID_X;
		y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 2 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_txt_chk_cash: RscText
	{
		idc = 1012;
		text = "zahl"; //--- ToDo: Localize;
		x = 33 * GUI_GRID_W + GUI_GRID_X;
		y = 8 * GUI_GRID_H + GUI_GRID_Y;
		w = 3 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_txt_sleepingbag: RscText
	{
		idc = 1010;
		text = "Sleepingbag"; //--- ToDo: Localize;
		x = 13.5 * GUI_GRID_W + GUI_GRID_X;
		y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 6 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_chk_sleepingbag: RscPicture
	{
		idc = 1202;
		text = "#(argb,8,8,3)color(1,0,0,1)";
		x = 21.5 * GUI_GRID_W + GUI_GRID_X;
		y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 1.25 * GUI_GRID_W;
		h = 0.75 * GUI_GRID_H;
	};
	class avd_pGUI_txt_toolkit: RscText
	{
		idc = 1001;
		text = "Toolkit"; //--- ToDo: Localize;
		x = 13.5 * GUI_GRID_W + GUI_GRID_X;
		y = 6 * GUI_GRID_H + GUI_GRID_Y;
		w = 6 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_txt_medikit: RscText
	{
		idc = 1002;
		text = "Medikit"; //--- ToDo: Localize;
		x = 13.5 * GUI_GRID_W + GUI_GRID_X;
		y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 6 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_txt_waterB: RscText
	{
		idc = 1013;
		text = "Waterbottle"; //--- ToDo: Localize;
		x = 13.5 * GUI_GRID_W + GUI_GRID_X;
		y = 9 * GUI_GRID_H + GUI_GRID_Y;
		w = 6 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_pGUI_chk_toolkit: RscPicture
	{
		idc = 1203;
		text = "#(argb,8,8,3)color(1,0,0,1)";
		x = 21.5 * GUI_GRID_W + GUI_GRID_X;
		y = 6 * GUI_GRID_H + GUI_GRID_Y;
		w = 1.25 * GUI_GRID_W;
		h = 0.75 * GUI_GRID_H;
	};
	class avd_pGUI_chk_medikit: RscPicture
	{
		idc = 1204;
		text = "#(argb,8,8,3)color(1,0,0,1)";
		x = 21.5 * GUI_GRID_W + GUI_GRID_X;
		y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 1.25 * GUI_GRID_W;
		h = 0.75 * GUI_GRID_H;
	};
	class avd_pGUI_chk_waterB: RscPicture
	{
		idc = 1205;
		text = "#(argb,8,8,3)color(1,0,0,1)";
		x = 21.5 * GUI_GRID_W + GUI_GRID_X;
		y = 9 * GUI_GRID_H + GUI_GRID_Y;
		w = 1.25 * GUI_GRID_W;
		h = 0.75 * GUI_GRID_H;
	};
	class avd_pGUI_btn_camp: RscButton
	{
		idc = 1605;
		text = "Create Camp"; //--- ToDo: Localize;
		action = "execVM ""playerStuff\GUI\GUIactions\createCamp.sqf""";
		x = 3 * GUI_GRID_W + GUI_GRID_X;
		y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 8 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};

};