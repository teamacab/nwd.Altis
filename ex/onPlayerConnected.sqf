#define SELF "ex\onPlayerConnected.sqf"
#include "include\ex.h"

private [
	"_id", 
    "_name", 
    "_n",
    "_str"];

_id = _this select 0;
_name = _this select 1;


if (_name == "__SERVER__") exitWith {};

_unit = objNull;


// find player, wtf.
_counter = 0;
while{(isNull _unit)} do {
	private ["_players"];
	if(_counter > 6000) exitWith {};
	_players = call CBA_fnc_players;
	_l = format["Got players: %1", _players];
    DLOG(_l);
	{

		_n = name _x;
        _l = format["[%4] Comparing _n %1 (%3) <=> _name %2", _n, _name, _x, _counter];
		DLOG(_l);
		if(_n == _name) then {
			DLOG("Found player " + str(_name));
			_unit = _x;
		};
	} foreach _players;
	_counter = _counter + 1;
};
["ex_network_opc", [_unit]] call CBA_fnc_localEvent;
if(isNull _unit) exitWith {};


/*
{
    DLOG(str(_x));
    _n = name _x;
    if(_name == _n) exitWith {
        //DLOG(_n + " is " + _name + ", calling event for " + _x);
        _str = format["Player %1 connected.", _x];
        DLOG(_str);
       ["ex_network_opc", [_x]] call CBA_fnc_localEvent;  
    };
  
} foreach playableUnits;
*/