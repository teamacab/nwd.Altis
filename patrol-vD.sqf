///////Simple Patrol script vD 1.4 - SPUn / LostVar
//
//*infantry units patrols independently around starting position in defined radius and also checks randomly buildings
//*Syntax: nul = [this] execVM "patrol-vD.sqf";
//     or: nul = [this,center position,radius] execVM "patrol-vD.sqf";
//*center position: [position array] (center point of patrol, f.ex. (getMarkerPos "marker1")) DEFAULT: (getPos _unit) = unit's starting position
//*radius: number (how far from center position will the patrol reach) DEFAULT: 150

private ["_wp1","_unit","_startingPos","_pDir","_pRange","_newPos","_buildingVisits","_justDidBuilding","_i","_i2","_bPoss","_chooseBuildingOrNot","_building","_center","_radius","_buildingVisitMax","_buildingDistanceLimit"];

_unit = _this select 0;
_center = _this select 1;
_radius = _this select 2;

if(isNil("_center"))then{_center = (getPos _unit);}else{_center = _center;};
if(isNil("_radius"))then{_radius = 150;}else{_radius = _radius;};

_startingPos = getPos _unit;
_newPos = _startingPos;
_justDidBuilding = false;

_buildingVisits = 0;
_buildingVisitMax = 5;
_buildingDistanceLimit = 50;
_building = nearestBuilding _unit;



while { alive _unit }do{
    if(isNull(_unit findNearestEnemy _unit))then{
        _unit forceSpeed 1;
    };

	_pDir = random 360;
    _pRange = 25 + random _radius;
    _newPos = [(_center select 0) + (sin _pDir) * _pRange, (_center select 1) + (cos _pDir) * _pRange, 0];

	if(surfaceIsWater _newPos)then{
			private["_randomWay","_dir"];
			_dir = (((_center) select 0) - (_newPos select 0)) atan2 (((_center) select 1) - (_newPos select 1));
			_randomWay = floor(random 2); 
			while{surfaceIsWater _newPos}do{
				if(_randomWay == 0)then{_dir = _dir + 20;}else{_dir = _dir - 20;};
				if(_dir < 0) then {_dir = _dir + 360;}; 
				_newPos = [(_center select 0) + (sin _dir) * _pRange, (_center select 1) + (cos _dir) * _pRange, 0];
			};
	};
    	waitUntil {unitReady _unit || _unit distance _newPos < 2};
    	_unit doMove _newPos;
    	waitUntil {unitReady _unit || _unit distance _newPos < 2};
	
	if(_buildingVisits < _buildingVisitMax)then{
		_buildingVisits = _buildingVisits + 1;
	}else{
		_buildingVisits = 0;
		_justDidBuilding = false;
	};

	if(!_justDidBuilding)then{
		_building = nearestBuilding _unit;
		if((_unit distance _building) < _buildingDistanceLimit)then{
			_chooseBuildingOrNot = round(random 3);
			if(_chooseBuildingOrNot < 2)then{
				_bPoss = [];
				_i = 0;
				while { ((_building buildingPos _i) select 0) != 0 } do {
    					_bPoss set [count (_bPoss), (_building buildingPos _i)];
					_i = _i + 1;
				};
				_i2 = 0;
    				while{_i2 < (count _bPoss)}do{
       					_newPos = (floor(random(count _bPoss)));
        				_newPos = _bPoss select _newPos;
        				waitUntil {unitReady _unit || _unit distance _newPos < 2};
        				_unit doMove _newPos;
        				waitUntil {unitReady _unit || _unit distance _newPos < 2};;
        				sleep 5 + random 25;
        				_i2 = _i2 + 1;
    				};
				_justDidBuilding = true;
			};
		};
	};
    	sleep 1 + random 59;
};

