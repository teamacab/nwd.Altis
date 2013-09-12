///////Simple Patrol script vE 1.4 - SPUn / LostVar
//
//*simple vehicle patrol around center position
//*Syntax: nul = [this] execVM "patrol-vE.sqf";
//     or: nul = [this,center position] execVM "patrol-vE.sqf";
//*center position: [position array] (center point of patrol, f.ex. (getMarkerPos "marker1")) DEFAULT: (getPos _unit) = unit's starting position
//note: patrol radius for vehicles is 50m + random 0-200m

private ["_unit","_newPos","_center","_pos","_crew","_run","_pDir","_pRange"];

_unit = _this select 0;
_center = _this select 1;

if(isNil("_center"))then{_center = (getPos _unit);}else{_center = _center;};

_newPos = getPos _unit;
_crew = crew _unit;
_run = true;

while{_run}do{
	_pDir = random 360;
    _pRange = 50 + (random 200);
    _newPos = [(_center select 0) + (sin _pDir) * _pRange, (_center select 1) + (cos _pDir) * _pRange, 0];
   
	if(surfaceIsWater _newPos)then{
			private["_randomWay","_dir"];
			_dir = ((_center select 0) - (_newPos select 0)) atan2 ((_center select 1) - (_newPos select 1));
			_randomWay = floor(random 2); 
			while{surfaceIsWater _newPos}do{
				if(_randomWay == 0)then{_dir = _dir + 20;}else{_dir = _dir - 20;};
				if(_dir < 0) then {_dir = _dir + 360;}; 
				_newPos = [(_center select 0) + (sin _dir) * _pRange, (_center select 1) + (cos _dir) * _pRange, 0];
			};
	};
	
    _pos = _newPos;
        
/*	_wp1 = (group _unit) addWaypoint [_newPos, 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointCombatMode "RED";
	_wp1 setWaypointSpeed "NORMAL";
*/		
    {
        _x doMove _newPos;
        _x setBehaviour "SAFE";
        _x limitSpeed 1;
    } foreach _crew;
	
	if({alive _x} count crew _unit == 0)exitWith{_run = false};
    waitUntil {(unitReady _unit)||(_unit distance _pos)<30};

	
    sleep 5 + (random 60);
};

