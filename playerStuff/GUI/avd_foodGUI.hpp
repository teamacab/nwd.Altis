class avd_foodGUI
{
	idd = -1;
	movingEnable = false;
	onLoad = "foodGUIopen = 1;[player]execVM ""playerStuff\GUI\GUIactions\eat_drink\foodCheck_GUI.sqf""";
	onUnload = "foodGUIopen = 0";

	#define GUI_GRID_X	(0)
	#define GUI_GRID_Y	(0)
	#define GUI_GRID_W	(0.025)
	#define GUI_GRID_H	(0.04)
	#define GUI_GRID_WAbs	(1)
	#define GUI_GRID_HAbs	(1)

	controls[]=
	{
		avd_foodGUI_back,
		avd_foodGUI_frame_main,
		avd_foodGUI_lb_food,
		avd_foodGUI_frame_food,
		avd_foodGUI_txt_food,
		avd_foodGUI_frame_drink,
		avd_foodGUI_lb_drink,
		avd_foodGUI_txt_drink,
		avd_foodGUI_btn_close,
		avd_foodGUI_btn_back,
		avd_foodGUI_txt_hunger,
		avd_foodGUI_txt_thirst,
		avd_foodGUI_txt_foodCount,
		avd_foodGUI_txt_drinkCount,
		avd_foodGUI_txt_chk_hunger,
		avd_foodGUI_txt_chk_foodCount,
		avd_foodGUI_txt_chk_thirst,
		avd_foodGUI_txt_chk_drinkCount,
		avd_foodGUI_btn_eat,
		avd_foodGUI_btn_drink,
		avd_foodGUI_frame_stats
	};

	class avd_foodGUI_back: IGUIBack
	{
		idc = 22001;
		x = 6 * GUI_GRID_W + GUI_GRID_X;
		y = 0 * GUI_GRID_H + GUI_GRID_Y;
		w = 28 * GUI_GRID_W;
		h = 10.5 * GUI_GRID_H;
	};
	class avd_foodGUI_frame_main: RscFrame
	{
		idc = 18001;
		text = "Food/Drink"; //--- ToDo: Localize;
		x = 6 * GUI_GRID_W + GUI_GRID_X;
		y = 0 * GUI_GRID_H + GUI_GRID_Y;
		w = 28 * GUI_GRID_W;
		h = 10.5 * GUI_GRID_H;
	};
	class avd_foodGUI_lb_food: RscListbox
	{
		idc = 15001;
		x = 8 * GUI_GRID_W + GUI_GRID_X;
		y = 2 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 6 * GUI_GRID_H;
	};
	class avd_foodGUI_frame_food: RscFrame
	{
		idc = 18011;
		x = 8 * GUI_GRID_W + GUI_GRID_X;
		y = 2 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 6 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_food: RscText
	{
		idc = 10001;
		text = "Food"; //--- ToDo: Localize;
		x = 8 * GUI_GRID_W + GUI_GRID_X;
		y = 1 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_frame_drink: RscFrame
	{
		idc = 18021;
		x = 16 * GUI_GRID_W + GUI_GRID_X;
		y = 2 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 6 * GUI_GRID_H;
	};
	class avd_foodGUI_lb_drink: RscListbox
	{
		idc = 15011;
		x = 16 * GUI_GRID_W + GUI_GRID_X;
		y = 2 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 6 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_drink: RscText
	{
		idc = 10011;
		text = "Drink"; //--- ToDo: Localize;
		x = 16 * GUI_GRID_W + GUI_GRID_X;
		y = 1 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_btn_close: RscButton
	{
		idc = 16001;
		text = "Close"; //--- ToDo: Localize;
		action = "closeDialog 0;"
		x = 29 * GUI_GRID_W + GUI_GRID_X;
		y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 3.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
	};
	class avd_foodGUI_btn_back: RscButton
	{
		idc = 16031;
		text = "Back"; //--- ToDo: Localize;
		action = "closeDialog 0;createDialog ""avd_pGUI""";
		x = 23.5 * GUI_GRID_W + GUI_GRID_X;
		y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 3.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_hunger: RscText
	{
		idc = 10021;
		text = "Hunger:"; //--- ToDo: Localize;
		x = 24 * GUI_GRID_W + GUI_GRID_X;
		y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 3.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_thirst: RscText
	{
		idc = 10031;
		text = "Thirst:"; //--- ToDo: Localize;
		x = 24 * GUI_GRID_W + GUI_GRID_X;
		y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 3.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_foodCount: RscText
	{
		idc = 10061;
		text = "Cnt Food:"; //--- ToDo: Localize;
		x = 24 * GUI_GRID_W + GUI_GRID_X;
		y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_drinkCount: RscText
	{
		idc = 10081;
		text = "Cnt Drink:"; //--- ToDo: Localize;
		x = 24 * GUI_GRID_W + GUI_GRID_X;
		y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_chk_hunger: RscText
	{
		idc = 10041;
		text = "zahl"; //--- ToDo: Localize;
		x = 29.5 * GUI_GRID_W + GUI_GRID_X;
		y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_chk_thirst: RscText
	{
		idc = 10051;
		text = "zahl"; //--- ToDo: Localize;
		x = 29.5 * GUI_GRID_W + GUI_GRID_X;
		y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_chk_foodCount: RscText
	{
		idc = 10071;
		text = "zahl"; //--- ToDo: Localize;
		x = 29.5 * GUI_GRID_W + GUI_GRID_X;
		y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_txt_chk_drinkCount: RscText
	{
		idc = 10091;
		text = "zahl"; //--- ToDo: Localize;
		x = 29.5 * GUI_GRID_W + GUI_GRID_X;
		y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class avd_foodGUI_btn_eat: RscButton
	{
		idc = 16011;
		text = "Eat"; //--- ToDo: Localize;
		action = "[player]execVM ""playerStuff\GUI\GUIactions\eat_drink\eat.sqf""";
		x = 8 * GUI_GRID_W + GUI_GRID_X;
		y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 3 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
	};
	class avd_foodGUI_btn_drink: RscButton
	{
		idc = 16021;
		text = "Drink"; //--- ToDo: Localize;
		action = "[player]execVM ""playerStuff\GUI\GUIactions\eat_drink\drink.sqf""";
		x = 16 * GUI_GRID_W + GUI_GRID_X;
		y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 3 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
	};
	class avd_foodGUI_frame_stats: RscFrame
	{
		idc = 18031;
		x = 24 * GUI_GRID_W + GUI_GRID_X;
		y = 2 * GUI_GRID_H + GUI_GRID_Y;
		w = 8 * GUI_GRID_W;
		h = 5 * GUI_GRID_H;
	};

};