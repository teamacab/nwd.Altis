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