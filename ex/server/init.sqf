#define SELF "ex\server\init.sqf"
#define PATH "ex\server"
#include "include\ex.h"

COMPF("fnc\init.sqf");

DLOG("Loading insurgency prototype.");
call compileFinal preprocessFileLineNumbers "ex\prototype\insurgency\init.sqf";