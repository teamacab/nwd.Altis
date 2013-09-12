//ARMA3Alpha function LV_fnc_ACcleanUp v0.85 - by SPUn / lostvar
//removes dead groups and groups in defined distance
private ["_i","_wGroup","_leader","_uns","_sUnit","_maxDis"];
_sUnit = _this select 0;
_maxDis = _this select 1;

while{true}do{
	_i = 0;
	while{_i < (count LV_ACS_activeGroups)}do{
		_wGroup = LV_ACS_activeGroups select _i;
		_leader = leader _wGroup;
		_uns = { alive _x } count units _wGroup;
		
		//hint format["cleanUp, total groups: %1",(count LV_ACS_activeGroups)];

		if(_uns < 1)then{
			LV_ACS_activeGroups = LV_ACS_activeGroups - [_wGroup];
			if((side _wGroup) == west)then{
				LV_AI_westGroups = LV_AI_westGroups - [_wGroup];
			}else{
				LV_AI_eastGroups = LV_AI_eastGroups - [_wGroup];
			};
		}else{
			if(_leader distance _sUnit > _maxDis)then{
				LV_ACS_activeGroups = LV_ACS_activeGroups - [_wGroup];
				if((side _wGroup) == west)then{
					LV_AI_westGroups = LV_AI_westGroups - [_wGroup];
				}else{
					LV_AI_eastGroups = LV_AI_eastGroups - [_wGroup];
				};
				{ deleteVehicle _x }forEach units _wGroup;
			};
		};
		sleep 1;
		_i = _i + 1;
	};
	sleep 20;
};