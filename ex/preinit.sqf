#define self "ex\preinit.sqf"
#define PATH "ex"
#include "include\ex.h"
#include "include\expy.h"


// loading common functions
COMPF("common\fnc\init.sqf");
COMPF("expy\common.sqf");

if(isServer) then {
	COMPF("expy\init.sqf");
};

// send CBA local event on every frame.
onEachFrame {
	["onEachFrame", _this] call CBA_fnc_localEvent;
};


if(!isServer) exitWith {};
private ["_time"];
_time = time;
DLOG("Precompiling.");

EX_LISTS = [] call CBA_fnc_hashCreate;
publicVariable "EX_LISTS";


// set config params

for "_i" from (0) to ((count paramsArray) - 1) do
{
	_str = configName((missionConfigFile/"Params") select _i);
    _val = paramsArray select _i;
    _code = format["EX_PARAM_%1 = %2; publicVariable ""EX_PARAM_%1"";", _str, _val];
    DLOG("Setting Param: " + str(_code));
    call compile _code;
};


EX_fnc_lists_add = {
  private ["_side", "_type", "_val", "_hash", "_list", "_ret"];
  _side = PARAM(0, civilian);
  _type = PARAM(1, nil);
  _val = PARAM(2, nil);
  _type = toLower _type;
  _side = str(_side);
  _ret = [EX_LISTS, _side] call CBA_fnc_hashHasKey;
  if(_ret) then {
    _hash = [EX_LISTS, _side] call CBA_fnc_hashGet;  
  } else {
    _hash = [] call CBA_fnc_hashCreate;
  };
  _ret = [_hash, _type] call CBA_fnc_hashHasKey;
  if(_ret) then {
    _list = [_hash, _type] call CBA_fnc_hashGet;  
  } else {
    _list = [];
  };
  
  _list = _list + [_val];
  [_hash, _type, _list] call CBA_fnc_hashSet;
  [EX_LISTS, _side, _hash] call CBA_fnc_hashSet;
  publicVariable "EX_LISTS";
  DLOG("added " + str(_val) + " to list " + str(_type) + " for " + str(_side));
  true;   
};

EX_fnc_lists_getRandom = {
    private ["_side", "_type", "_hash", "_list", "_random", "_ret"];
    _side = PARAM(0, civilian);
    _type = PARAM(1, "");
    _random = PARAM(2, false);
    
    _hash = [EX_LISTS, str(_side)] call CBA_fnc_hashGet;
    _list = [_hash, _type] call CBA_fnc_hashGet;
    
    _ret = _list select (floor(random(count(_list)-1)));
    _ret;
};
EX_fnc_lists_get = {
    private ["_side", "_type", "_hash", "_list", "_random", "_ret"];
    _side = PARAM(0, civilian);
    _type = PARAM(1, "");
    _type = toLower _type;
    _random = PARAM(2, false);
    DLOG("Looking for " + str(_side) + ", type: " + str(_type));
    _hash = [EX_LISTS, str(_side)] call CBA_fnc_hashGet;
    _list = [_hash, _type] call CBA_fnc_hashGet;
	_list;
};
// compile vehicles list
_cfgVehicles = configFile >> "cfgVehicles";
_mags = [];
for "_i" from 0 to (count _cfgVehicles)-1 do {
	_c = _cfgVehicles select _i;
    
    if(isClass _c) then {
      _cName = configName(_c);
      if(_cName in EXCLUDE) exitWith {};
      _numSide = getNumber(_c >> "side");
      _fuelCap = getNumber(_c >> "fuelCapacity");
      if(_numSide == 4) exitWith {};
      
      _side = civilian;
      switch(_numSide) do {
        case 0: {
          _side = EAST;  
        };
        case 1: {
          _side = WEST;  
        };  
        case 2: {
          _side = RESISTANCE;  
        };
        default {
          _side = CIVILIAN;  
        };
      };
      _hasDriver = getNumber(_c >> "hasDriver");
      _displayName = getText(_c >> "displayName");
      _scope = getNumber(_c >> "scope");
      if(_scope < 1) exitWith { DLOG("SKIPPING " + str(_displayName)); };
      DLOG(_displayName);
      if(_displayName == "") exitWith {};
	  if(_hasDriver == 1 and _fuelCap == 0 and !(_cName isKindOf "Man")) exitWith {}; // ignore erstmal.
      // cars:

      switch(true) do {
        case (_cName isKindOf "Animal"): {
            [_side, "Animal", _cName] call EX_fnc_lists_add;  
        };
        case (_cName isKindOf "Man"): {
            [_side, "Man", _cName] call EX_fnc_lists_add;
        };
        case (_cName isKindOf "Tank"): {
            [_side, "Tank", _cName] call EX_fnc_lists_add;
        };
        case (_cName isKindOf "Air"): {
            [_side, "Air", _cName] call EX_fnc_lists_add;
        };
        case (_cName isKindOf "Truck"): {
            [_side, "Truck", _cName] call EX_fnc_lists_add;
        };
        case (_cName isKindOf "Car"): {
            [_side, "Car", _cName] call EX_fnc_lists_add;
        };  
      };      
      
	  
    };
};
publicVariable "EX_LISTS";



DLOG("Precompiling took " + str(time - _time) + " seconds.");