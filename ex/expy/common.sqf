#define SELF "ex\expy\common.sqf"

#include "include\ex.h"
#include "include\expy.h"

EX_fnc_getLoadOut = compileFinal preprocessFileLineNumbers "ex\expy\ext\AEROSON_fnc_getLoadout.sqf";
EX_fnc_setLoadOut = compileFinal preprocessFileLineNumbers "ex\expy\ext\AEROSON_fnc_setLoadout.sqf";
EX_fnc_RPY = {
  	private ["_code"];
  	_code = _this select 0;
  
    [{ ("Arma2Net.Unmanaged" callExtension format["py %1", _this]) }, _code, { isServer }] call EX_fnc_MPexec;  
};

EX_fnc_PY = {
    private ["_code"];
  	_code = _this select 0;

    ("Arma2Net.Unmanaged" callExtension format["py %1", _code])
};


EX_fnc_DataUpdater = {
   private ["_unit"];
   _unit = _this select 0;
   _func = _this select 1;
   

   
   if(isnil "_func") exitWith {};
    /*
   _id = _unit addEventHandler ["Dammaged", {
		_unit = _this select 0;
        _func = "Unit";
        _sid = netid _unit;
        if(isPlayer _unit) then { _func = "Player"; _sid = getPlayerUID _unit; };
		_str = format["ex.get%3('%1').damage = '%2'; ex.get%3('%1').update()", _sid, damage _unit, _func];
		RPY(_str);
	}];
	_id = _unit addEventHandler ["AnimStateChanged", {
		_unit = _this select 0;
		_anim = _this select 1;
        _func = "Unit";
        _sid = netid _unit;
        if(isPlayer _unit) then { _func = "Player"; _sid = getPlayerUID _unit; };
		_str = format["ex.get%3('%1').animation = '%2'; ex.get%3('%1').update()", _sid, _anim, _func];
		RPY(_str);
	}];
	
	
	[_unit] spawn {
		private ["_unit", "_func"];
		_unit = _this select 0;
        _func = "Unit";
        _sid = netid _unit;
        if(isPlayer _unit) then { _func = "Player"; _sid = getPlayerUID _unit; };
		waitUntil {
			_str = format["ex.get%3('%1').posATL = '%2'; ex.get%3('%1').posASL = '%4'; ex.get%3('%1').dir = '%5'; ex.get%3('%1').update()", _sid, getPosATL _unit, _func, getPosASL _unit, getDir _unit];
			RPY(_str);
			sleep 5;
			isNull _unit;
		};
	};
    */
    [_unit] spawn {
		waitUntil { ! isNil "EXPY_INIT"; };
		private ["_unit", "_func"];
		_unit = _this select 0;
        _func = "Unit";
        _sid = netid _unit;
        if(isPlayer _unit) then { _func = "Player"; _sid = getPlayerUID _unit; };
        _varname = vehicleVarName _unit;
		waitUntil {
            _loadout = [_unit, ["ammo"]] call EX_fnc_getLoadOut;
            _anim = animationState _unit;
            _vars = [_unit] call EX_fnc_getAllVariables;
            _str = [];
			_str = _str + [format["ex.get%3('%1').loadout = '%2'", _sid, _loadout, _func, _varname]];
			_str = _str + [format["ex.get%3('%1').posATL = '%2'; ex.get%3('%1').posASL = '%4'; ex.get%3('%1').dir = '%5'", _sid, getPosATL _unit, _func, getPosASL _unit, getDir _unit, _varname]];
            _str = _str + [format["ex.get%3('%1').animation = '%2'", _sid, _anim, _func, _varname]];
            _str = _str + [format["ex.get%3('%1').damage = '%2'", _sid, damage _unit, _func, _varname]];
            _str = _str + [format["ex.get%3('%1').side = '%2'", _sid, side _unit, _func]];
            _str = _str + [format["ex.get%3('%1').rank = '%2'", _sid, rank _unit, _func]];
            _str = _str + [format["ex.get%3('%1').skill = '%2'", _sid, skill _unit, _func]];
            _str = _str + [format["ex.get%3('%1').varname = '%2'", _sid, vehicleVarName _unit, _func]];
            _str = _str + [format["ex.get%3('%1').variables = '%2'", _sid, _vars, _func]];
            //_str = _str + [format["ex.get%3('%1').update()", _sid, damage _unit, _func]];
            //DLOG(str(_str));
            _str = [_str, ";"] call CBA_fnc_join;
            RPY(_str);
			sleep 1;
			isNull _unit;
		};
	};
    
     
};