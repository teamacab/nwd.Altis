#define SELF "ex\common\fnc\variable.sqf"
#include "include\ex.h"

EX_fnc_setVariable = {
	private ["_obj", "_key", "_val", "_index"];
	_obj = PARAM(0, nil);
	_key = PARAM(1, nil);
	_val = PARAM(2, nil);
    _broadcast = PARAM(3, false);
    _index = _obj getVariable "EX_var_index";
    if(isNil "_index") then {
    	_index = [] call CBA_fnc_hashCreate;
    };
    _index = [_index, _key, _val] call CBA_fnc_hashSet;
	_obj setVariable[_key, _val, _broadcast];
    _obj setVariable["EX_var_index", _index, _broadcast];
};

EX_fnc_getVariable = {
	_obj = PARAM(0, nil);
	_key = PARAM(1, nil);
	_obj getVariable _key;
};

EX_fnc_getAllVariables = {
	_obj = PARAM(0, nil);
	_sum = [];
	_index = _obj getVariable "EX_var_index";
	if(isNil "_index") then {
    	_index = [] call CBA_fnc_hashCreate;
    };
	_index;
};

EX_fnc_setAllVariables = {
  	private ["_unit", "_hash"];
    _unit = _this select 0;
    _hash = _this select 1;
    
    _setVars = {
        [_unit, _key, _value] call CBA_fnc_setVariable;
    };
    [_hash, _setVars] call CBA_fnc_hashEachPair;
};