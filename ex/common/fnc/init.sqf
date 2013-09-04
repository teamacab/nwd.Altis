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
