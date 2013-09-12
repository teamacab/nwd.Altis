//ARMA3Alpha function LV_fnc_ACpatrol v1.2 - by SPUn / lostvar
private ["_pType","_range","_dir","_disPAI","_wGroup","_leader","_newX","_newY","_nX","_nY","_xV","_yV","_newPos","_i","_sUnit","_maxRange"];
_sUnit = _this select 0;
_maxRange = _this select 1;
_pType = _this select 2;
while{true}do{
	//hint "patrol";
	_i = 0;
	while{_i < (count LV_ACS_activeGroups)}do{
		_wGroup = LV_ACS_activeGroups select _i;
		_leader = leader _wGroup;
		
		
		if(unitReady _leader)then{
		
			_range = _leader distance _sUnit;
			if(_range < _maxRange)then{_range = _maxRange;};
			_dir = (((getPos _sUnit) select 0) - ((getPos _leader) select 0)) atan2 (((getPos _sUnit) select 1) - ((getPos _leader) select 1));
			if(_dir < 0) then {_dir = _dir + 360;}; 
			_dir = (_dir - 45) + random 90;
			_newPos = [((getPos _sUnit) select 0) + (sin _dir) * (_range), ((getPos _sUnit) select 1) + (cos _dir) * (_range), 0];
			
		
		//NEW METHOD 2:
		//-if water -> tries another spot with same range by changing angle in random direction 20 degrees until valid spot is found
		if(surfaceIsWater _newPos)then{
			private["_randomWay","_dir"];
			_dir = (((getPos _sUnit) select 0) - ((getPos _leader) select 0)) atan2 (((getPos _sUnit) select 1) - ((getPos _leader) select 1));
			_randomWay = floor(random 2);
			while{surfaceIsWater _newPos}do{
				if(_randomWay == 0)then{_dir = _dir + 20;}else{_dir = _dir - 20;};
				if(_dir < 0) then {_dir = _dir + 360;}; 
				_newPos = [((getPos _sUnit) select 0) + (sin _dir) * _range, ((getPos _sUnit) select 1) + (cos _dir) * _range, 0];
			};
		}; 
		
		
			//green dot markers to show where "waypoints" are set:
			//_markerstr = createMarker[("markername"+(str _leader)),_newPos];
			//_markerstr setMarkerShape "ICON";
			//("markername"+(str _leader)) setMarkerType "mil_dot";
			//("markername"+(str _leader)) setMarkerColor "ColorGreen";
				
			if((typeName _pType) == "ARRAY")then{
				_wp1 = _wGroup addWaypoint [_newPos, 0];
				_wp1 setWaypointType (_pType select 1);
				_wp1 setWaypointBehaviour (_pType select 0);
				_wp1 setWaypointCombatMode "RED";
				_wp1 setWaypointSpeed "FULL";
			}else{
				{_x doMove _newPos;}forEach units _wGroup;
			};
		};
		sleep 1;
		_i = _i + 1;
	};
	sleep 20;
};