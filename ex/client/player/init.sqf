#define SELF "ex\client\player\init.sqf"
#define PATH "ex\client\player"
#include "include\ex.h"

waitUntil { T_INIT };

removeAllItems player;
removeAllWeapons player;


player addAction ["Run debug code.", "ex\debug_code.sqf"];