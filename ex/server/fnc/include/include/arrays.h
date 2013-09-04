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

#define NORMAL_SPAWN [["hgun_P07_F", 0.4], ["V_BandollierB_cbr", 0.6], ["U_B_CombatUniform_mcam_tshirt", 0.25], ["U_O_CombatUniform_ocamo", 0.25], ["hgun_ACPC2_F", 0.3], ["16Rnd_9x21_Mag", 0.75], ["ACRE_PRC148_UHF", 0.2]]

#define RARE_SPAWN [["ARP_Objects_smartphone_m", 0.1], ["ARP_Objects_Toughbook_M", 0.1], ["G_Diving", 0.5], ["30Rnd_65x39_caseless_mag", 0.4], ["20Rnd_762x51_Mag", 0.3], ["V_HarnessOGL_brn", 0.05], ["U_B_Wetsuit", 0.07], ["ARP_Objects_satbag_m", 0.1], ["1Rnd_HE_Grenade_shell", 0.2], ["ItemGPS", 0.01], ["HandGrenade", 0.3], ["arifle_MX_GL_F", 0.2], ["B_Carryall_oucamo", 0.15], ["srifle_EBR_F", 0.1], ["ACRE_PRC119", 0.03], ["NVGoggles", 0.01], ["V_RebreatherB", 0.02]]

#define MONEY_SPAWN [["ARP_Objects_moneya_m", 0.75, 5], ["ARP_Objects_moneya_m", 0.5, 10], ["ARP_Objects_moneya_m", 0.3, 50], ["ARP_Objects_moneya_m", 0.1, 100]]

#define LOW_CONSUME_ANIMATIONS [["amovpercmstpsnonwnondnon", "amovpercmwlksnonwnondf"], 0.025]
#define MID_CONSUME_ANIMATIONS [["amovpercmrunsnonwnondf"], 0.1]
#define HIGH_CONSUME_ANIMATIONS [["amovpercmevasnonwnondf"], 0.25]
#define CONSUME_LISTS [LOW_CONSUME_ANIMATIONS, MID_CONSUME_ANIMATIONS, HIGH_CONSUME_ANIMATIONS]

#define DRINK_CLASSES ["ARP_Objects_waterbottle_m", "ARP_Objects_water_m"]

#define DRINK_SPAWN [["ARP_Objects_waterbottle_m", 0.8], ["ARP_Objects_waterbottle_m", 0.3, 6]]

#define FOOD_SPAWN [["ARP_Objects_mre_m", 1]]

#define FOOD_CLASSES ["ARP_Objects_mre_m"] 

#define EXCLUDE ["PaperCar", "O_APC_Wheeled_02_base_F", "Civilian", "Civilian_F", "Officer_soldier", "SoldierEB"]

#define ITEM_PASSPORT "ARP_Objects_passport_m"

#define ANIM_HANDCUFF "amovpknlmstpsnonwnondnon"

#define GUER_UNITS [resistance, "man"] call AVD_fnc_lists_get
#define BLUE_UNITS [west, "man"] call AVD_fnc_lists_get
#define CIV_UNITS [civilian, "man"] call AVD_fnc_lists_get
#define RED_UNITS [east, "man"] call AVD_fnc_lists_get


#define SHIP_WRECKS ["Land_Wreck_Traw_F", "Land_Wreck_Traw2_F", "Land_UWreck_MV22_F", "Land_UWreck_FishingBoat_F"]