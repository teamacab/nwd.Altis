#define SELF "ex\common\fnc\variable.sqf"
#include "include\ex.h"

EX_fnc_setVariable = {
	private ["_obj", "_key", "_val", "_index"];
	_obj = PARAM(0, nil);
	_key = PARAM(1, nil);
	_val = PARAM(2, nil);
	_broadcast = PARAM(3, false);
	_index = _obj getVariable "EX_var_index";
	if(isNil "_index") then { _index = []; };
	if(! _key in _index) then { _index = _index + [_key]; _obj setVariable ["EX_var_index", _index, false]; };
	_obj setVariable[_key, _val, _broadcast];
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
	if(isNil "_index") exitWith { _sum };
	{
		_t = _obj getVariable _x;
		_sum = _sum + [_t];
	} foreach _index;
	_sum;
};