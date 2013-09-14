[] call (uinamespace getvariable 'bis_fnc_recompile');
'bis_functions_mainscope' call (uinamespace getvariable ['bis_fnc_endLoadingScreen',{}]);
_initCodes = [];

_this = createCenter resistance;
_center_0 = _this;


_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [6513.9985, 12120.102, 0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir 160.56973;
	_this setPos [6513.9985, 12120.102, 0.00012207031];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [6517.3047, 12122.032, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 20.546232;
	_this setPos [6517.3047, 12122.032, -7.6293945e-005];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodPile_F", [6513.9619, 12124.819, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir -37.061668;
	_this setPos [6513.9619, 12124.819, -1.5258789e-005];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Campfire_burning_F", [6512.3564, 12123.704, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setPos [6512.3564, 12123.704, 1.5258789e-005];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Compass_F", [6515.0327, 12121.303, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setPos [6515.0327, 12121.303, 4.5776367e-005];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_folded_F", [6515.7905, 12119.99, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setPos [6515.7905, 12119.99, 3.0517578e-005];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6510.9854, 12121.275, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setDir 205.22969;
	_this setPos [6510.9854, 12121.275, 7.6293945e-005];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_folded_F", [6515.167, 12120.402, 0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir -42.51355;
	_this setPos [6515.167, 12120.402, 0.0001373291];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["CamoNet_OPFOR_F", [6515.5737, 12122.658, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir -7.5215087;
	_this setPos [6515.5737, 12122.658, 6.1035156e-005];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["CamoNet_OPFOR_big_F", [6421.394, 12139.271, 0.81198066], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir 208.05817;
	_this setPos [6421.394, 12139.271, 0.81198066];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [6489.7378, 12113.752, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir 93.558426;
	_this setPos [6489.7378, 12113.752, 1.5258789e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [6489.5845, 12110.406], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 94.867928;
	_this setPos [6489.5845, 12110.406];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["CamoNet_OPFOR_open_F", [6435.4883, 12162.067, 0.54263318], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setDir -30.492512;
	_this setPos [6435.4883, 12162.067, 0.54263318];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Offroad_01_armed_F", [6418.6904, 12143.346, 0.00021362305], [], 0, "NONE"];
	_vehicle_20 = _this;
	_this setDir 3.4491124;
	_this setPos [6418.6904, 12143.346, 0.00021362305];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Offroad_01_F", [6446.1509, 12172.536, 4.5776367e-005], [], 0, "NONE"];
	_vehicle_21 = _this;
	_this setDir -67.864853;
	_this setVehicleVarName "avd_ahabsCar_base";
	avd_ahabsCar_base = _this;
	_this setPos [6446.1509, 12172.536, 4.5776367e-005];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["B_Mortar_01_F", [6476.2202, 12198.259, 0.00015258789], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setPos [6476.2202, 12198.259, 0.00015258789];
	_initCodes set [count _initCodes,[_this,"this attachTo [avd_ahabsCar_base, [0.25,-2.25,0.1]];"]];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Portable_generator_F", [6436.8003, 12161.148, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [6436.8003, 12161.148, 6.1035156e-005];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [6438.1338, 12160.916, -0.00010681152], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setPos [6438.1338, 12160.916, -0.00010681152];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MetalBarrel_F", [6434.5884, 12158.954, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setPos [6434.5884, 12158.954, -7.6293945e-005];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MetalBarrel_F", [6435.4497, 12159.302, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setPos [6435.4497, 12159.302, -0.00012207031];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MetalBarrel_empty_F", [6434.6895, 12159.819, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setPos [6434.6895, 12159.819, -0.0001373291];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [6436.1343, 12159.901, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setPos [6436.1343, 12159.901, -9.1552734e-005];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [6435.8774, 12160.354, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setPos [6435.8774, 12160.354, -4.5776367e-005];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_AmmoOrd_F", [6436.0625, 12164.221, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir -113.50567;
	_this setPos [6436.0625, 12164.221, 9.1552734e-005];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["I_static_AA_F", [6382.5728, 12242.245, -0.00036621094], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir -202.10016;
	_this setPos [6382.5728, 12242.245, -0.00036621094];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_AmmoVeh_F", [6438.6211, 12165.313, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setDir 16.646309;
	_this setPos [6438.6211, 12165.313, 3.0517578e-005];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Grenades_F", [6388.2432, 12085.105, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setPos [6388.2432, 12085.105, -3.0517578e-005];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["FirePlace_burning_F", [6404.543, 12111.304, 0.00018310547], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setPos [6404.543, 12111.304, 0.00018310547];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pillow_camouflage_F", [6408.0327, 12111.524, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setPos [6408.0327, 12111.524, -7.6293945e-005];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_F", [6407.7095, 12111.361, -0.00021362305], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setDir 95.485138;
	_this setPos [6407.7095, 12111.361, -0.00021362305];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ClutterCutter_large_F", [6406.9399, 12110.663, -0.00030517578], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setPos [6406.9399, 12110.663, -0.00030517578];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ClutterCutter_large_F", [6406.1953, 12108.087, -0.00015258789], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setPos [6406.1953, 12108.087, -0.00015258789];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Basket_F", [6403.9448, 12110.731, 0.00048828125], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setPos [6403.9448, 12110.731, 0.00048828125];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagBunker_Small_F", [6383.9263, 12088.271, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setDir 93.654243;
	_this setPos [6383.9263, 12088.271, -3.0517578e-005];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["I_static_AA_F", [6391.1191, 12179.112, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir 88.23436;
	_this setPos [6391.1191, 12179.112, 1.5258789e-005];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesWooden_F", [6389.3472, 12097.643], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir 255.37735;
	_this setPos [6389.3472, 12097.643];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [6389.1816, 12095.348, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir 172.59253;
	_this setPos [6389.1816, 12095.348, -1.5258789e-005];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesShabby_F", [6389.1768, 12093.861, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir -36.012161;
	_this setPos [6389.1768, 12093.861, -3.0517578e-005];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sack_F", [6388.6118, 12089.96, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setPos [6388.6118, 12089.96, -3.0517578e-005];
};

_vehicle_66 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_heap_F", [6393.4893, 12090.078, 0.31534043], [], 0, "CAN_COLLIDE"];
	_vehicle_66 = _this;
	_this setPos [6393.4893, 12090.078, 0.31534043];
};

_vehicle_68 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_heap_F", [6393.4731, 12091.561, 0.29737645], [], 0, "CAN_COLLIDE"];
	_vehicle_68 = _this;
	_this setDir -42.334167;
	_this setPos [6393.4731, 12091.561, 0.29737645];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [6388.0186, 12093.254, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setPos [6388.0186, 12093.254, -4.5776367e-005];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["FirePlace_burning_F", [6486.1626, 12110.021, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setPos [6486.1626, 12110.021, -9.1552734e-005];
};

_group_1 = createGroup _center_0;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [6550.7197, 12357.055, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [6550.7197, 12357.055, 3.0517578e-005];
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this; [group this,getPos this,350,2,true] call CBA_fnc_taskDefend;"]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [6445.3198, 12239.608, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [6445.3198, 12239.608, 4.5776367e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this;"]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [6489.0664, 12332.755, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [6489.0664, 12332.755, 1.5258789e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this;"]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [6489.7769, 12129.489, 0.0001373291], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [6489.7769, 12129.489, 0.0001373291];
	_this setDir -0.021410821;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this;"]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [6526.812, 12317.353, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [6526.812, 12317.353, 1.5258789e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this;"]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [6444.0864, 12238.118, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [6444.0864, 12238.118, 4.5776367e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this;"]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [6513.3667, 12141.127, -0.00010681152], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [6513.3667, 12141.127, -0.00010681152];
	_this setDir -0.021410821;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this;"]];
};

_unit_18 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [6465.3979, 12203.379, 0.0001373291], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [6465.3979, 12203.379, 0.0001373291];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this; [group this, getPos this, 350, 18, ""MOVE"", ""CARELESS"", ""WHITE"", ""LIMITED"", """", """", [3,12,24]] call CBA_fnc_taskPatrol;"]];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [6478.5493, 12206.198, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [6478.5493, 12206.198, 3.0517578e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this;"]];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Wps_F", [6436.1348, 12162.384, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setDir -35.272175;
	_this setPos [6436.1348, 12162.384, 1.5258789e-005];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Quadbike_01_F", [6423.7163, 12140.968, 6.1035156e-005], [], 0, "NONE"];
	_vehicle_85 = _this;
	_this setDir -34.210613;
	_this setPos [6423.7163, 12140.968, 6.1035156e-005];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Quadbike_01_F", [6421.7437, 12139.808, 9.1552734e-005], [], 0, "NONE"];
	_vehicle_87 = _this;
	_this setDir -21.761557;
	_this setPos [6421.7437, 12139.808, 9.1552734e-005];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Quadbike_01_F", [6425.2686, 12142.358, -4.5776367e-005], [], 0, "NONE"];
	_vehicle_89 = _this;
	_this setDir -47.055298;
	_this setPos [6425.2686, 12142.358, -4.5776367e-005];
};

_vehicle_96 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_transport_F", [6064.4482, 12376.288, -1.5258789e-005], [], 0, "NONE"];
	_vehicle_96 = _this;
	_this setDir 177.28531;
	_this setPos [6064.4482, 12376.288, -1.5258789e-005];
};

_vehicle_98 = objNull;
if (true) then
{
	_this = createVehicle ["ACRE_RadioBox", [6432.4502, 12160.064, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_98 = _this;
	_this setPos [6432.4502, 12160.064, 4.5776367e-005];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Wps_F", [6436.249, 12165.575, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_100 = _this;
	_this setDir -35.272175;
	_this setPos [6436.249, 12165.575, -9.1552734e-005];
	_initCodes set [count _initCodes,[_this,"clearWeaponCargoGlobal this; clearMagazineCargoGlobal this; this addItemCargoGlobal [""sc_bedroll"",10]; this addItemCargoGlobal [""sc_knife"",10]; this addItemCargoGlobal [""sc_waterbottle"",10]; this addItemCargoGlobal [""sc_mre"",10];"]];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = createVehicle ["IG_supplyCrate_F", [6433.4824, 12163.222, -0.0001373291], [], 0, "NONE"];
	_vehicle_103 = _this;
	_this setDir 52.224342;
	_this setPos [6433.4824, 12163.222, -0.0001373291];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = createVehicle ["O_HMG_01_F", [6577.2373, 12227.288], [], 0, "CAN_COLLIDE"];
	_vehicle_110 = _this;
	_this setDir 133.4397;
	_this setPos [6577.2373, 12227.288];
};

_vehicle_111 = objNull;
if (true) then
{
	_this = createVehicle ["CamoNet_INDP_F", [6576.6489, 12230.636, -1.2058262], [], 0, "CAN_COLLIDE"];
	_vehicle_111 = _this;
	_this setDir -52.065086;
	_this setPos [6576.6489, 12230.636, -1.2058262];
};

_vehicle_116 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Mound01_8m_F", [6578.3359, 12228.006, 0.21545297], [], 0, "CAN_COLLIDE"];
	_vehicle_116 = _this;
	_this setDir -59.291939;
	_this setPos [6578.3359, 12228.006, 0.21545297];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Mound01_8m_F", [6579.957, 12234.453, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setDir 84.611328;
	_this setPos [6579.957, 12234.453, -1.5258789e-005];
};

_vehicle_120 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Plane_Transport_01_F", [6475.207, 12154.228, 0.00038146973], [], 0, "CAN_COLLIDE"];
	_vehicle_120 = _this;
	_this setDir 82.568832;
	_this setPos [6475.207, 12154.228, 0.00038146973];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = createVehicle ["O_Heli_Light_02_unarmed_F", [8458.0957, 25111.684, -9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_122 = _this;
	_this setDir 0.66588569;
	_this setPos [8458.0957, 25111.684, -9.9182129e-005];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Box_NATO_Ammo_F", [8464.7627, 25088.445, 0.00033569336], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setPos [8464.7627, 25088.445, 0.00033569336];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["IG_supplyCrate_F", [8466.5811, 25089.432, 0.00025939941], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setDir -69.750488;
	_this setPos [8466.5811, 25089.432, 0.00025939941];
};

_vehicle_125 = objNull;
if (true) then
{
	_this = createVehicle ["Box_NATO_WpsSpecial_F", [8464.207, 25086.637, 5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_125 = _this;
	_this setDir -46.585903;
	_this setPos [8464.207, 25086.637, 5.3405762e-005];
};

_this = createCenter west;
_center_1 = _this;

_group_2 = createGroup _center_1;

_group_3 = createGroup _center_1;

_unit_28 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_G_Soldier_F", [8464.3164, 25092.445, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_unit_28 = _this;
	_this setPos [8464.3164, 25092.445, 7.6293945e-005];
	_this setDir -159.68896;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setBehaviour ""CARELESS"";"]];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_soldier_UAV_F", [8459.3584, 25090.828, 0.0002822876], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [8459.3584, 25090.828, 0.0002822876];
	_this setDir 127.90273;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unassignItem ""NVGoggles""; this removeItem ""NVGoggles""; removeHeadgear this;"]];
};

_unit_30 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_G_Soldier_lite_F", [8461.0127, 25087.053, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_unit_30 = _this;
	_this setPos [8461.0127, 25087.053, 9.1552734e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_3 selectLeader _this;};
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Campfire_burning_F", [8462.4004, 25090.207, 0.00032043457], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setPos [8462.4004, 25090.207, 0.00032043457];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [8461.3906, 25098.113, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setDir -92.362885;
	_this setPos [8461.3906, 25098.113, 2.2888184e-005];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [8456.9199, 25096.086, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setDir -140.66367;
	_this setPos [8456.9199, 25096.086, -1.5258789e-005];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [8465.9033, 25095.699, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir -39.965317;
	_this setPos [8465.9033, 25095.699, 7.6293945e-005];
};

_unit_32 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_G_Soldier_LAT_F", [8506.4434, 25056.129, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_unit_32 = _this;
	_this setPos [8506.4434, 25056.129, 2.2888184e-005];
	_this setDir 163.87115;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
};

_unit_33 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_recon_medic_F", [8503.8193, 25056.934, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_unit_33 = _this;
	_this setPos [8503.8193, 25056.934, -2.2888184e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllAssignedItems this;"]];
};

_group_4 = createGroup _center_1;

_unit_34 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["B_G_Soldier_A_F", [7519.3994, 23021.857, 0.00018882751], [], 0, "CAN_COLLIDE"];
	_unit_34 = _this;
	_this setPos [7519.3994, 23021.857, 0.00018882751];
	_this setDir -141.27698;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_4 selectLeader _this;};
};

_unit_35 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["B_G_medic_F", [7519.6572, 23017.068, -9.894371e-005], [], 0, "CAN_COLLIDE"];
	_unit_35 = _this;
	_this setPos [7519.6572, 23017.068, -9.894371e-005];
	_this setDir -35.840927;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
};

_vehicle_141 = objNull;
if (true) then
{
	_this = createVehicle ["O_Boat_Transport_01_F", [7521.25, 23069.688, 0], [], 0, "NONE"];
	_vehicle_141 = _this;
	_this setPos [7521.25, 23069.688, 0];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
