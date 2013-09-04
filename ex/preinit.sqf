#define self "ex\preinit.sqf"
#define PATH "ex"
#include "include\ex.h"
#include "include\expy.h"


// loading common functions
COMPF("common\fnc\init.sqf");
COMPF("expy\init.sqf");

onEachFrame {
	["onEachFrame", _this] call CBA_fnc_localEvent;
};