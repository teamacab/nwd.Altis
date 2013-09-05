#define SELF "ex\xeh\unit.sqf"
#define PATH "ex\xeh"
#include "include\ex.h"
#include "include\expy.h"

["ex_unit_create", _this] call CBA_fnc_localEvent;
["ex_unit_create_post", _this] spawn CBA_fnc_localEvent;
