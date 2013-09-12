#define SELF "ex\common\fnc\init.sqf"
#define PATH "ex\common\fnc"
#include "include\ex.h"

private ["_scripts"];
COMPF("debug.sqf");
_scripts = ["remote.sqf", "variable.sqf"];

{
	DLOG("Loading common fnc " + str(_x));
	COMPF(_x);
} forEach _scripts;

EX_fnc_trackingMarker = compileFinal preprocessFileLineNumbers "ex\common\fnc\trackingMarker.sqf";
EX_fnc_getIndex = compileFinal preprocessFileLineNumbers "ex\common\fnc\getIndex.sqf";

EX_fnc_call = {
	private ["_code", "_args"];
	_code = PARAM(0, nil);
	_args = PARAM(1, []);
	
    if(isNil "_code") exitWith { DLOG("Nil code"); };
    if(isNil "_args") then { _args = []; };
    //DLOG("CODE: " + str(_code));
    switch(typeName _code) do {
    	case 'STRING': {
        	_code = compile _code;  
        };  
    };
    
    _args call _code;
};

EX_fnc_spawn = {
  _this spawn EX_fnc_call;  
};