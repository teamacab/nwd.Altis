#define CARGO_HOUSES ["Land_Cargo_House_V1_F", "Land_Cargo_House_V2_F"]
#define x_isCargoHouse(obj) (typeOf obj in CARGO_HOUSES)

#define HQ_HOUSES ["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V2_F", "Land_MilOffices_V1_F", "Land_i_Barracks_V2_F"]
#define x_isHQHouse(obj) (typeOf obj in HQ_HOUSES)

#define TOWERS ["Land_Cargo_Patrol_V1_F", "Land_Cargo_Patrol_V2_F"]
#define x_isTower(obj) (typeOf obj in TOWERS)

#define CIVILIAN_HOUSES ["Land_i_Stone_HouseSmall_V1_F", "Land_i_Stone_Shed_V1_F", "Land_i_Stone_HouseBig_V1_F", "Land_Slum_House03_F", "Land_Slum_House01_F", "Land_Slum_House02_F", "Land_i_House_Big_02_V1_F", "Land_i_House_Big_01_V1_F", "Land_i_House_Small_03_V1_F", "Land_i_House_Small_01_V2_F", "Land_u_House_Small_02_V1_F", "Land_Lighthouse_small_F"]
#define SHOP_HOUSES ["Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F"]

#define GARAGE_HOUSES ["Land_i_Garage_V1_F"]

#define FUELS [["Land_dp_bigTank_F", 5000], ["Land_dp_smallTank_F", 3000]]

#define AIRPORT_TOWERS ["Land_Airport_Tower_F"]

#define ITEM_SPAWN_HOUSES ["Land_i_Stone_HouseBig_V1_F", "Land_i_Stone_Shed_V1_F", "Land_Metal_Shed_F", "Land_ToiletBox_F"]

#define CAPTURE_BUILDINGS ["Land_Radar_F"]

#define MARINA_PIERS ["Land_Pier_F", "Land_Pier_small_F", ]

#define FLAG_EAST "Land_LampHalogen_F"
#define FLAG_WEST "Land_LampHalogen_F"
#define FLAG_GUER "Land_LampHalogen_F"
#define FLAG_CIV "Land_LampHalogen_F"

//#define SPAWN_HOLDER "Box_NATO_Wps_F"
#define SPAWN_HOLDER "GroundWeaponHolder"
#define TREASURE_HOLDER "GroundWeaponHolder"

#define NORMAL_SPAWN [["9Rnd_45ACP_Mag", 0.4], ["hgun_ACPC2_F", 0.3], ["sc_lighter", 0.5], ["ACRE_PRC148_UHF", 0.2], ["sc_bedroll", 0.5], ["ToolKit", 0.5], ["sc_knife", 0.1]]

#define RARE_SPAWN [["ItemGPS", 0.01], ["HandGrenade", 0.3], ["ACRE_PRC119", 0.03], ["NVGoggles", 0.01], ["sc_knife", 0.5]]

#define MONEY_SPAWN ["sc_money"]

#define LOW_CONSUME_ANIMATIONS [["amovpercmstpsnonwnondnon", "amovpercmwlksnonwnondf"], 0.025]
#define MID_CONSUME_ANIMATIONS [["amovpercmrunsnonwnondf"], 0.1]
#define HIGH_CONSUME_ANIMATIONS [["amovpercmevasnonwnondf"], 0.25]
#define CONSUME_LISTS [LOW_CONSUME_ANIMATIONS, MID_CONSUME_ANIMATIONS, HIGH_CONSUME_ANIMATIONS]

#define DRINK_CLASSES ["sc_waterbottle","sc_soda","sc_juicebox","sc_energy_drink","sc_beer","sc_coffee"]

#define DRINK_SPAWN [["sc_waterbottle", 0.8], ["sc_soda", 0.3], ["sc_juicebox", 0.3], ["sc_energy_drink", 0.3], ["sc_beer", 0.3], ["sc_coffee", 0.3]]

#define FOOD_SPAWN [["sc_cookedmeat",0.5],["sc_mre",0.5],["sc_donut",0.5],["sc_chips",0.5],["sc_carrot",0.5],["sc_cannedfood",0.5];]

#define FOOD_CLASSES ["sc_cookedmeat","sc_mre","sc_donut","sc_chips","sc_carrot","sc_cannedfood"]

#define EXCLUDE ["PaperCar", "O_APC_Wheeled_02_base_F", "Civilian", "Civilian_F", "Officer_soldier", "SoldierEB"]

#define ITEM_PASSPORT "ARP_Objects_passport_m"

#define ANIM_HANDCUFF "amovpknlmstpsnonwnondnon"

#define GUER_UNITS [resistance, "man"] call EX_fnc_lists_get
#define BLUE_UNITS [west, "man"] call EX_fnc_lists_get
#define CIV_UNITS [civilian, "man"] call EX_fnc_lists_get
#define RED_UNITS [east, "man"] call EX_fnc_lists_get


#define SHIP_WRECKS ["Land_Wreck_Traw_F", "Land_Wreck_Traw2_F", "Land_UWreck_MV22_F", "Land_UWreck_FishingBoat_F"]