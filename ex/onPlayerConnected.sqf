#define SELF "ex\onPlayerConnected.sqf"
#include "include\ex.h"

private [
	"_id", 
    "_name", 
    "_n",
    "_str"];

_id = _this select 0;
_name = _this select 1;
["ex_network_opc_classic", [_id, _name]] call CBA_fnc_globalEvent;
{
    _n = name _x;
    if(_name == _n) exitWith {
        //DLOG(_n + " is " + _name + ", calling event for " + _x);
        _str = format["Player %1 connected.", _x];
        DLOG(_str);
       ["ex_network_opc", [_x]] call CBA_fnc_globalEvent;  
    };
  
} foreach playableUnits;
