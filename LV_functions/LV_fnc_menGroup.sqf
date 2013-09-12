//ARMA3Alpha function LV_fnc_menGroup v1.1 - by SPUn / lostvar
//Spawn infantry group and returns leader
private ["_pos","_side","_size","_BLUmen","_OPFmen","_men","_amount","_BLUhq","_BLUgrp","_OPFhq","_OPFgrp","_grp","_i","_man1","_man","_leader"];
_pos = _this select 0;
_side = _this select 1;
_size = _this select 2;
_grpId = if (count _this > 3) then { _this select 3;} else {nil};	

_BLUmen = ["B_spotter_F","B_sniper_F","B_soldier_AR_F","B_soldier_exp_F","B_Soldier_GL_F","B_soldier_M_F","B_medic_F","B_Soldier_F","B_soldier_repair_F","B_soldier_LAT_F","B_Soldier_SL_F","B_Soldier_lite_F","B_Soldier_TL_F"];
_OPFmen = ["O_spotter_F","O_sniper_F","O_Soldier_F","O_Soldier_AR_F","O_soldier_exp_F","O_Soldier_GL_F","O_soldier_M_F","O_medic_F","O_soldier_repair_F","O_Soldier_LAT_F","O_Soldier_lite_F","O_Soldier_SL_F","O_Soldier_TL_F"];

_men = [];
if(typeName _size == "ARRAY")then{
	_amount = ((random (_size select 0)) + (_size select 1));
}else{
	_amount = _size;
};

switch(_side)do{
	case 0:{
		_men = _BLUmen;
		_BLUhq = createCenter west;
		_BLUgrp = createGroup west;
		_grp = _BLUgrp;
	};
	case 1:{
		_men = _OPFmen;
		_OPFhq = createCenter east;
		_OPFgrp = createGroup east;
		_grp = _OPFgrp;
	};
};

_i = 0; 
for "_i" from 0 to _amount do {
	_man1 = _men select (floor(random(count _men)));
	_man = _grp createUnit [_man1, _pos, [], 0, "NONE"];
};

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _grp",_grpId];
};

_leader = leader _grp;
_leader;