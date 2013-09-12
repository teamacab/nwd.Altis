/*
				***		ARMA3Alpha AMBIENT COMBAT SCRIPT v1.0 - by SPUn / lostvar	***
				
			Creates ambient combat around defined object/unit with multiple customizable features.
			
		Calling the script:
		
				default: 	nul = [] execVM "ambientCombat.sqf";
				custom: 	nul = [min range, max range, min delay, max delay, groups, center unit, AI skills, communication,
								dissapear distance, custom init, patrol type] execVM "ambientCombat.sqf";
								
	Parameters:
		
		min range 			= 	number 		(meters, minimum range from center unit for AI to spawn) 			DEFAULT: 450
		max range 			= 	number 		(meters, maximum range from center unit for AI to spawn) 			DEFAULT: 900
		min delay 			= 	number 		(seconds, minimum spawning delay for AI) 							DEFAULT: 30
		max delay 			= 	number 		(seconds, maximum spawning delay for AI) 							DEFAULT: 300
		groups 				= 	number 		(how many AI groups can be alive at the same time) 					DEFAULT: 6
		center unit 		= 	unit 		(unit or object which is center of all action) 						DEFAULT: player
		AI skills 			= 	"default" 	(default AI skills) 												DEFAULT: "default"
							or	number		(0-1.0 - this value will be set to all AI skills)
							or	array		(all AI skills invidiually in array, values 0-1.0, order:)
								[aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general,
								endurance,reloadSpeed]
		communication 		= 	0/1 		(if 1, then AI groups will communicate and inform each others about enemies) DEFAULT: 0
		dissapearDistance 	= 	number 		(distance from center unit where AI units/groups will dissapear) 	DEFAULT: 2500
								NOTE: Make sure this is bigger than *maxRange !		
		custom init 		= 	"init commands" (if you want something in init field of units, put it here) 	DEFAULT: nil
								NOTE: Keep it inside quotes, and if you need quotes in init commands, you MUST 
								use ' or "" instead of ". EXAMPLE: "hint 'this is hint';"
		patrol type			=	1 or array 	(1 = doMove for each unit individually)								DEFAULT: 1
								array = ["waypointBehaviour","waypointType"] = waypoint for group 
								ex: ["AWARE","SAD"]
		
		Fully customized example:
				nul = [150,600,10,30,8,player,[0.2,0.3,0.1,0.55,0.25,1,1,0.25,1,1],1,800,"hint format['spawning unit: %1',this];",
					["AWARE","SAD"]] execVM "ambientCombat.sqf";
					
*/
if (hasInterface and !isServer)exitWith{};
private ["_patrolType","_customInit","_communication","_eastGroups","_westGroups","_skills","_syncedUnit","_groupAmount","_grp","_minRange","_maxRange","_minTime","_maxTime","_centerPos","_range","_dir","_spawnPos","_side","_menOrVehicle","_timeDelay","_BLUhq","_BLUgrp","_OPFhq","_OPFgrp","_skls"];

_minRange = if(count _this > 0)then{_this select 0;} else {450};	 
_maxRange = if(count _this > 1)then{_this select 1;} else {900};	 
_minTime = if(count _this > 2)then{_this select 2;} else {30};	 
_maxTime = if(count _this > 3)then{_this select 3;} else {300};	 
_groupAmount = if(count _this > 4)then{_this select 4;} else {6};	 
_syncedUnit = if(count _this > 5)then{_this select 5;} else {player};	 
_skills = if(count _this > 6)then{_this select 6;} else {"default"};	 
_communication = if(count _this > 7)then{_this select 7;} else {0};	 
_dissapearDistance = if(count _this > 8)then{_this select 8;} else {2500};	 
_customInit = if(count _this > 9)then{_this select 9;} else {nil};	 
_patrolType = if(count _this > 10)then{_this select 10;} else {1};	

if(isNil("LV_fullVehicle"))then{LV_fullVehicle = compile preprocessFile "LV_functions\LV_fnc_fullVehicle.sqf";};
if(isNil("LV_menGroup"))then{LV_menGroup = compile preprocessFile "LV_functions\LV_fnc_menGroup.sqf";};
if(isNil("LV_ACpatrol"))then{LV_ACpatrol = compile preprocessFile "LV_functions\LV_fnc_ACpatrol.sqf";};
if(isNil("LV_ACcleanUp"))then{LV_ACcleanUp = compile preprocessFile "LV_functions\LV_fnc_ACcleanUp.sqf";};
if(isNil("LV_ACskills"))then{LV_ACskills = compile preprocessFile "LV_functions\LV_fnc_ACskills.sqf";};
if(isNil("LV_AIcommunication"))then{LV_AIcommunication = compile preprocessFile "LV_functions\LV_fnc_AIcommunication.sqf";};
if(isNil("LV_vehicleInit"))then{LV_vehicleInit = compile preprocessFile "LV_functions\LV_fnc_vehicleInit.sqf";};
if(isNil("LV_RandomSpot"))then{LV_RandomSpot = compile preprocessFile "LV_functions\LV_fnc_randomSpot.sqf";};

if(isNil("LV_ACS_activeGroups"))then{LV_ACS_activeGroups = [];}; 
if(isNil("LV_AI_westGroups"))then{LV_AI_westGroups = [];}; 
if(isNil("LV_AI_eastGroups"))then{LV_AI_eastGroups = [];}; 

if(_communication == 1)then{ACcommunication = [] spawn LV_AIcommunication;};
ACcleanUp = [_syncedUnit,_dissapearDistance] spawn LV_ACcleanUp;
ACpatrol = [_syncedUnit,_maxRange,_patrolType] spawn LV_ACpatrol;

while{true}do{
	if(_maxTime == _minTime)then{
		_timeDelay = _maxTime;
	}else{
		_timeDelay = (random(_maxTime - _minTime)) + _minTime;
	};
	sleep _timeDelay;
	if(count LV_ACS_activeGroups < _groupAmount)then{
		if(count LV_ACS_activeGroups == (_groupAmount - 1))then{sleep _timeDelay;};
		_centerPos = getPos _syncedUnit;
		if(_maxRange == _minRange)then{
			_range = _maxRange;
		}else{
			_range = (random(_maxRange - _minRange)) + _minRange;
		};
		_dir = random 360;
		_spawnPos = [(_centerPos select 0) + (sin _dir) * _range, (_centerPos select 1) + (cos _dir) * _range, 0];
		
		if(surfaceIsWater _spawnPos)then{
			private["_randomWay","_dir"];
			_dir = (((getPos _syncedUnit) select 0) - (_spawnPos select 0)) atan2 (((getPos _syncedUnit) select 1) - (_spawnPos select 1));
			_randomWay = floor(random 2); 
			while{surfaceIsWater _spawnPos}do{
				if(_randomWay == 0)then{_dir = _dir + 20;}else{_dir = _dir - 20;};
				if(_dir < 0) then {_dir = _dir + 360;}; 
				_spawnPos = [(_centerPos select 0) + (sin _dir) * _range, (_centerPos select 1) + (cos _dir) * _range, 0];
			};
		}; 
				
		_side = floor(random 2);
		_westGroups = {side _x == west} count LV_ACS_activeGroups;
		_eastGroups = {side _x == east} count LV_ACS_activeGroups;
		if(_westGroups > _eastGroups)then{_side = 1;}else{_side = 0;};
		
		_menOrVehicle = floor(random 10);
		if(_menOrVehicle < 4)then{
			_grp = [_spawnPos, _side] call LV_fullVehicle;
		}else{
			_grp = [_spawnPos, _side, [10,3]] call LV_menGroup;
		};
		if(typeName _skills != "STRING")then{_skls = [_grp,_skills] call LV_ACskills;};
		LV_ACS_activeGroups set [(count LV_ACS_activeGroups), (group _grp)];
		
		if(_side == 1)then{
			LV_AI_eastGroups set [(count LV_AI_eastGroups), (group _grp)];
		}else{
			LV_AI_westGroups set [(count LV_AI_westGroups), (group _grp)];
		};
		
		if(!isNil("_customInit"))then{ 
			{
				[_x,_customInit] spawn LV_vehicleInit;
			} forEach units group _grp;
		};
	};
};
