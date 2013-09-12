//ARMA3Alpha function LV_fnc_fullVehicle v1.0 - by SPUn / lostvar
//Spawns random vehicle full of random units and returns driver 
private ["_pos1","_grp","_BLUhq","_BLUgrp","_men","_veh","_OPFhq","_OPFgrp","_man1","_man","_i","_pos","_side","_BLUmen","_OPFmen","_BLUveh","_OPFveh","_veh1","_vehSpots","_vehicle","_vehCrew","_driver"];
_pos = _this select 0;
_side = _this select 1;

_BLUmen = ["B_spotter_F","B_sniper_F","B_soldier_AR_F","B_soldier_exp_F","B_Soldier_GL_F","B_soldier_M_F","B_medic_F","B_Soldier_F","B_soldier_repair_F","B_soldier_LAT_F","B_Soldier_SL_F","B_Soldier_lite_F","B_Soldier_TL_F"];
_OPFmen = ["O_spotter_F","O_sniper_F","O_Soldier_F","O_Soldier_AR_F","O_soldier_exp_F","O_Soldier_GL_F","O_soldier_M_F","O_medic_F","O_soldier_repair_F","O_Soldier_LAT_F","O_Soldier_lite_F","O_Soldier_SL_F","O_Soldier_TL_F"];
_BLUveh = ["B_Hunter_F","B_Hunter_HMG_F","B_Hunter_RCWS_F","B_Quadbike_F","B_AH9_F","O_Ka60_F"];
_OPFveh = ["O_Ifrit_F","O_Ifrit_GMG_F","O_Ifrit_MG_F","O_Quadbike_F","O_Ka60_F","B_AH9_F"];

_men = [];
_veh = [];

switch(_side)do{
	case 0:{
		_BLUhq = createCenter west;
		_BLUgrp = createGroup west;
		_men = _BLUmen;
		_veh = _BLUveh;
		_grp = _BLUgrp;
	};
	case 1:{
		_OPFhq = createCenter east;
		_OPFgrp = createGroup east;
		_men = _OPFmen;
		_veh = _OPFveh;
		_grp = _OPFgrp;
	};
};

_veh1 = _veh select (floor(random(count _veh)));
_vehSpots = getNumber (configFile >> "CfgVehicles" >> _veh1 >> "transportSoldier");
_pos1 = _pos findEmptyPosition[1, 300, _veh1];

sleep 0.5;
if(count _pos1 == 0)then{_pos1 = _pos;};

if(_veh1 == "B_AH9_F" || _veh1 == "O_Ka60_F")then{
	_vehicle = createVehicle [_veh1, _pos1, [], 0, "FLY"];
}else{
	_vehicle = createVehicle [_veh1, _pos1, [], 0, "NONE"];
	_vehicle setPos _pos1;
};

//Yes, there's function to fill crew, but there occured somekind of problem when I tried to
//add BLUFOR crew to OPFOR vehicle.. Gotta figure it out some day.
if ((_vehicle emptyPositions "driver") != 0) then {
	_man1 = _men select (floor(random(count _men)));
	_man = _grp createUnit [_man1, _pos1, [], 0, "NONE"];
	_man moveInDriver _vehicle;
};
if ((_vehicle emptyPositions "commander") != 0) then {
	_man1 = _men select (floor(random(count _men)));
	_man = _grp createUnit [_man1, _pos1, [], 0, "NONE"];
	_man moveInCommander _vehicle;
};
if ((_vehicle emptyPositions "gunner") != 0) then {
	while{(_vehicle emptyPositions "gunner") > 0}do{
		_man1 = _men select (floor(random(count _men)));
		_man = _grp createUnit [_man1, _pos1, [], 0, "NONE"];
		_man moveInGunner _vehicle;
	};
};

//Stupid way to make sure vehicle wont flip on it's side at spawn
_vehicle allowDamage false;
sleep 2;
if(((vectorUp _vehicle) select 2) != 0)then{ _vehicle setvectorup [0,0,0]; };
sleep 2;
_vehicle allowDamage true;

if(_vehSpots > 0)then{
	_i = 1; 
	for "_i" from 1 to _vehSpots do {
		_man1 = _men select (floor(random(count _men)));
		_man = _grp createUnit [_man1, _pos1, [], 0, "NONE"];
		_man moveInCargo _vehicle;
	};
};

_driver = driver _vehicle;
_driver;