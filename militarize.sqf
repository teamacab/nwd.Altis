#define SELF "militarize.sqf"
//#define NODEBUG
#include "ex\include\ex.h"
#include "ex\include\arrays.h"
 
 /*
				***		ARMA3Alpha MILITARIZE AREA SCRIPT v1.1 - by SPUn / lostvar	***

			Calling the script:
			
		default: 	nul = [this] execVM "militarize.sqf";
		
		custom:		nul = [target, side, radius, spawn men, spawn vehicles, still, men ratio, vehicle ratio, 
							skills, group, custom init, ID] execVM "militarize.sqf";

		Parameters:
		
	target 		=	center point (name of marker or object or unit which is the center point of militarized area,
									or position array)
	side 		=	(0 = civilian, 1 = blue, 2 = red) 																DEFAULT: 2
	radius 		=	(from center position) 																			DEFAULT: 150
	spawn men 	= 	true or false 																					DEFAULT: true
	spawn vehicles =true or false 																					DEFAULT: false
	still 		= 	true or false 	(if false, then units will patrol in radius, checkin also buildings) 			DEFAULT: false
	men ratio 	=	(amount of spawning men is radius * men ratio, ie: 250 * 0.2 = 50 units) 						DEFAULT: 0.3
					NOTE: Array - you can also use following syntax: [amount,random amount] for example:
					[10,5] will spawn at least 10 units + random 1-5 units 
	vehicle ratio= 	(amount of spawning vehicles is radius * vehicle ratio, ie: 250 * 0.1 = 25 vehicles) 			DEFAULT: 0.1
					NOTE: Same array syntax as in "men ratio" works here too!
	skills 		= 	"default" 	(default AI skills) 																DEFAULT: "default"
				or	number	=	0-1.0 = this value will be set to all AI skills, ex: 0.8
				or	array	=	all AI skills invidiually in array, values 0-1.0, order:
		[aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed] 
		ex: 	[0.75,0.5,0.6,0.85,0.9,1,1,0.75,1,1] 
	group 		= 	group name or nil (if you want units in existing group, set it here. if nil, new group is made) DEFAULT: nil
					EXAMPLE: (group player)
	custom init = 	"init commands" (if you want something in init field of units, put it here) 					DEFAULT: nil
				NOTE: Keep it inside quotes, and if you need quotes in init commands, you MUST use ' or "" instead of ".
				EXAMPLE: "hint 'this is hint';"
	ID 			= 	number (if you want to delete units this script creates, you'll need ID number for them) 		DEFAULT: nil

EXAMPLE: nul = [this,2,50,true,false,false,[10,0],0.1,[0.2,0.2,0.2,0.85,0.9,0.75,0.1,0.6,1,1],nil,nil,13] execVM "militarize.sqf";
				will spawn 10 red team men, which will patrol in radius of 50m from the object this is called from
*/
if (hasInterface and !isServer)exitWith{};
private ["_grpId","_customInit","_cPos","_skls","_skills","_maxD","_mi","_dir","_range","_unitType","_unit","_radius","_men","_vehicles","_still","_centerPos","_menAmount","_vehAmount","_milHQ","_milGroup","_menArray","_blueMenArray","_redMenArray","_yellowMenArray","_sideOption","_vehArray","_vi","_pos","_blueCarArray","_redCarArray","_yellowCarArray","_sPos","_vCrew","_allUnitsArray","_menRatio","_vehRatio","_sPos2"];
DLOG("RED UNITS: " + str(RED_UNITS));
_cPos = if(count _this > 0)then{_this select 0;};
_sideOption = if (count _this > 1) then { _this select 1; }else{2;};
_radius = if (count _this > 2) then { _this select 2; }else{150;};
_men = if (count _this > 3) then { _this select 3; }else{true;};
_vehicles = if (count _this > 4) then { _this select 4; }else{false;};
_still = if (count _this > 5) then { _this select 5; }else{false;};
_menRatio = if (count _this > 6) then { _this select 6; }else{0.3;};
_vehRatio = if (count _this > 7) then { _this select 7; }else{0.02;};
_skills = if (count _this > 8) then { _this select 8; }else{"default";};
_milGroup = if (count _this > 9) then { _this select 9; }else{nil;};
_customInit = if (count _this > 10) then { _this select 10; }else{nil;};
_grpId = if (count _this > 11) then { _this select 11; }else{nil;};

if(_cPos in allMapMarkers)then{
	_centerPos = getMarkerPos _cPos;
}else{
	if (typeName _cPos == "ARRAY") then{
		_centerPos = _cPos;
	}else{
		_centerPos = getPos _cPos;
	};
};

if(isNil("LV_ACskills"))then{LV_ACskills = compile preprocessFile "LV_functions\LV_fnc_ACskills.sqf";};
if(isNil("LV_vehicleInit"))then{LV_vehicleInit = compile preprocessFile "LV_functions\LV_fnc_vehicleInit.sqf";};

if(typeName _menRatio == "ARRAY")then{	
	_menAmount = (_menRatio select 0) + (random (_menRatio select 1));
}else{
	_menAmount = round (_radius * _menRatio);
};
if(typeName _vehRatio == "ARRAY")then{	
	_vehAmount = (_vehRatio select 0) + (random (_vehRatio select 1));
}else{
	_vehAmount = round (_radius * _vehRatio);
};
_allUnitsArray = [];

_blueMenArray = [west, "man"] call EX_fnc_lists_get;
_redMenArray = [east, "man"] call EX_fnc_lists_get;
_yellowMenArray = [civilian, "man"] call EX_fnc_lists_get;

_blueCarArray = [west, "car"] call EX_fnc_lists_get;
_redCarArray = [east, "car"] call EX_fnc_lists_get;
_yellowCarArray = [civilian, "car"] call EX_fnc_lists_get;

switch (_sideOption) do { 
    case WEST: {
        _milHQ = createCenter west;
		if(isNil("_milGroup"))then{_milGroup = createGroup west;}else{_milGroup = _milGroup;};
        _menArray = _blueMenArray;
        _vehArray = _blueCarArray;
    }; 
    case EAST: {
        _milHQ = createCenter east;
        if(isNil("_milGroup"))then{_milGroup = createGroup east;}else{_milGroup = _milGroup;};
        _menArray = _redMenArray;
        _vehArray = _redCarArray;
    }; 
    default {
        _milHQ = createCenter civilian;
        if(isNil("_milGroup"))then{_milGroup = createGroup civilian;}else{_milGroup = _milGroup;};
        _menArray = _yellowMenArray;
        _vehArray = _yellowCarArray;
    }; 
};


if(_men)then{
	_mi = 0;
	while {_mi < _menAmount}do{
		_mi = _mi + 1;
		_dir = random 360;
		_range = random _radius;
		_unitType = _menArray select (floor(random(count _menArray)));
		_unit = _milGroup createUnit [_unitType, _centerPos, [], 0, "NONE"];
		_unit setPos [(_centerPos select 0) + (sin _dir) * _range, (_centerPos select 1) + (cos _dir) * _range, 0];
		
		if(!_still)then{
			nul = [_unit,_centerPos,_radius] execVM "patrol-vD.sqf";
		};
        _unit allowDamage false;
        _allUnitsArray set [(count _allUnitsArray), _unit];
	};
};

_milGroup setBehaviour "SAFE";

if(_vehicles)then{
    _vi = 0;
    while{_vi < _vehAmount}do{
        
        _vi = _vi + 1;
        _dir = random 360;
        _range = random _radius;
        _unitType = _vehArray select (floor(random(count _vehArray)));
        _pos = [];
        _sPos = [(_centerPos select 0) + (sin _dir) * _range, (_centerPos select 1) + (cos _dir) * _range, 0];
		
        //_pos = _sPos findEmptyPosition[10, 300, _unitType];
        _road = [_centerPos, random _radius] call EX_fnc_getDistantRoad;
        /*_rl = _centerPos nearRoads _radius;
        _rl = [_rl] call CBA_fnc_shuffle;
        _road = _rl select 0;*/
        DLOG("Got road: " + str(_road));
        _pos = position (_road select 0);
        DLOG("Got pos: " + str(_pos));
		sleep 0.5;
		if(isNil "_pos") then {_pos = _sPos;};

		_unit = createVehicle [_unitType, _pos, [], 0, "NONE"]; 
        _unit allowDamage false;
        
        _vCrew = [_unit, _milGroup] call BIS_fnc_spawnCrew;
        
        _allUnitsArray set [(count _allUnitsArray), _unit];
        
        _crew = crew _unit;
            
  	if(!_still)then{
			nul = [_unit,_centerPos,_radius] execVM 'patrol-vE.sqf';
	};
        sleep 3;
        if(((vectorUp _unit) select 2) != 0)then{ _unit setvectorup [0,0,0]; };  
    };
};

	{ 
		if((typeName _skills != "STRING")&&((side _x) != civilian))then{ _skls = [_x,_skills] call LV_ACskills; }; 
		if(!isNil("_customInit"))then{ 
			[_x,_customInit] spawn LV_vehicleInit;
		};
	} forEach units _milGroup;


sleep 3;
{
    _x allowDamage true;
}forEach _allUnitsArray;

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _milGroup",_grpId];
};

