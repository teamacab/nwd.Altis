#define SELF "ex\client\init.sqf"
#define PATH "ex\client"
#include "include\ex.h"

// let's see what type of client we have.
DLOG("Checking type of client.");
if(hasInterface) then {
	DLOG("Player.");
	// alright, we have a player.
	SPWN("player\init.sqf");
} else {
	DLOG("Headless");
	// it's a headless client
	SPWN("headless\init.sqf");
};