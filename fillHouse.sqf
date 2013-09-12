#include "x_avd\include\arrays.h"
/* 
				***		ARMA3Alpha FILL HOUSE SCRIPT v1.1 - by SPUn / lostvar	***

						Fills house or buildings in defined range with soldiers
						
			Calling the script:
			
					default: nul = [this] execVM "fillHouse.sqf";
					
					custom:  nul = [target, side, patrol, patrol type, spawn rate, radius, skills, group, 
									custom init, ID] execVM "fillHouse.sqf";

		Parameters:
		
	target 		= 	center point 	(Game Logics/Objects/Marker name, ex: GL01 or this or "marker1")
	side 		= 	1 or 2 			(1 = blue team, 2 = red team) 											DEFAULT: 2
	patrol 		= 	true or false 	(if true, units will patrol) 											DEFAULT: true
	patrol type = 	1 or 2 			(1=only inside building, 2=also outside of building) 					DEFAULT: 2
	spawn rate  = 	1-100 OR Array 	(on how many percentage of possible positions are soldiers spawned) 	DEFAULT: 50
				NOTE: Array - you can also use following syntax: [amount,random amount] for example:
				[10,12] will spawn at least 10 units + random 12 units 
	radius 		= 	1 or larger number (1=nearest building. if larger number, then all buildings in radius) DEFAULT: 1
	skills 		= 	"default" 	(default AI skills) 														DEFAULT: "default"
				or	number	=	0-1.0 = this value will be set to all AI skills, ex: 0.8
				or	array	=	all AI skills invidiually in array, values 0-1.0, order:
		[aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed] 
		ex: 	[0.75,0.5,0.6,0.85,0.9,1,1,0.75,1,1] 
	group 		= 	group name or nil (if you want units in existing group, set it here. if nil, 			DEFAULT: nil
					new group is made) EXAMPLE: (group player)
	custom init = 	"init commands" (if you want something in init field of units, put it here) 			DEFAULT: nil
				NOTE: Keep it inside quotes, and if you need quotes in init commands, you MUST use ' or "" instead of ".
				EXAMPLE: "hint 'this is hint';"
	ID 			= 	number (if you want to delete units this script creates, you'll need ID number for them)DEFAULT: nil

EXAMPLE: 	nul = [this, 2, true, 2, 50, 1, 0.75, nil, nil, 9] execVM "fillHouse.sqf";
			spawns in nearest building east soldiers in 50% of possible building positions with skill 0.75,
			and makes them patrol in & outside of that building
*/
if (hasInterface and !isServer) exitWith{};
private ["_grpId","_customInit","_center","_skls","_skills","_a","_buildings","_rat","_milHQ","_milGroup","_menArray","_i","_newPos","_i2","_unitType","_unit","_building","_sideOption","_blueMenArray","_redMenArray","_bPoss","_patrol","_pFile","_pType"];

_center = if (count _this > 0) then { _this select 0;};	 
_sideOption = if (count _this > 1) then { _this select 1;} else {2};	 
_patrol = if (count _this > 2) then { _this select 2;} else {true};	 
_pType = if (count _this > 3) then { _this select 3;} else {2};	 
_ratio = if (count _this > 4) then { _this select 4;} else {50};	 
_radius = if (count _this > 5) then { _this select 5;} else {1};	 
_skills = if (count _this > 6) then { _this select 6;} else {"default"};	 
_milGroup = if (count _this > 7) then { _this select 7;} else {nil};	 
_customInit = if (count _this > 8) then { _this select 8;} else {nil};	 
_grpId = if (count _this > 9) then { _this select 9;} else {nil};	 

if(isNil("LV_ACskills"))then{LV_ACskills = compile preprocessFile "LV_functions\LV_fnc_ACskills.sqf";};
if(isNil("LV_vehicleInit"))then{LV_vehicleInit = compile preprocessFile "LV_functions\LV_fnc_vehicleInit.sqf";};

_blueMenArray = [west, "man"] call AVD_fnc_lists_get;
_redMenArray = [east, "man"] call AVD_fnc_lists_get;

switch (_sideOption) do { 
    case 1: {
        _milHQ = createCenter west;
		if(isNil("_milGroup"))then{_milGroup = createGroup west;}else{_milGroup = _milGroup};
        _menArray = _blueMenArray;
    };  
    default {
        _milHQ = createCenter east;
        if(isNil("_milGroup"))then{_milGroup = createGroup east;}else{_milGroup = _milGroup};
        _menArray = _redMenArray;
    }; 
};

if(_center in allMapMarkers)then{
	_cenM = getMarkerPos _center;
	_center = _cenM;
};

if(_radius > 1)then{
	_buildings = nearestObjects [_center, ["house"], _radius];
}else{
	_building = nearestBuilding _center;
	_buildings = [_building];
};
if(count _buildings == 0) exitWith{};

_bPoss = [];
_a = 0;
while { _a < (count _buildings) } do {
	_building = (_buildings select _a);
	_i = 0;
	while { ((_building buildingPos _i) select 0) != 0 } do {
		_bPoss set [count (_bPoss), (_building buildingPos _i)];
		_i = _i + 1;
	};
	_a = _a + 1;
};

if(typeName _ratio == "ARRAY")then{
	_rat = (_ratio select 0) + (random (_ratio select 1));
}else{
	_rat = ceil((_ratio / 100) * (count _bPoss));
};
_i2 = 0;
while{_i2 < _rat}do{
    //if(_radius > 1)then{_newPos = _bPoss select floor(random count _bPoss);}else{_newPos = _bPoss select _i2;};
	_newPos = _bPoss select floor(random count _bPoss);
	if(_rat < count _bPoss)then{_bPoss = _bPoss - [_newPos];};
    _i2 = _i2 + 1;

    _unitType = _menArray select (floor(random(count _menArray)));
	_unit = _milGroup createUnit [_unitType, _newPos, [], 0, "NONE"];
	_unit setpos _newPos;  
	
	if(typeName _skills != "STRING")then{_skls = [_unit,_skills] call LV_ACskills;};

	if(_patrol)then{
        	switch (_pType) do {
            		case 1: {
                		_pFile = "patrol-vF.sqf";
            		};
            		case 2: {
                		_pFile = "patrol-vG.sqf";
            		};
        	};
			nul = [_unit] execVM format["%1",_pFile]; 
	}else{
        	doStop _unit;
    };
	if(!isNil("_customInit"))then{ 
		nul = [_unit,_customInit] spawn LV_vehicleInit;
	};
};

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _milGroup",_grpId];
};

