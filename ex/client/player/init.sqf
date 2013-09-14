#define SELF "ex\client\player\init.sqf"
#define PATH "ex\client\player"
#include "include\ex.h"

waitUntil { T_INIT };

removeAllItems player;
removeAllWeapons player;
removeAllAssignedItems player;
DLOG("Starting DataUpdater");
[player, "Player"] spawn EX_fnc_DataUpdater;
//player addAction ["Run debug code.", "ex\debug_code.sqf"];

player addAction ["Playermenu", {
    createDialog "avd_pGUI";
}];

execVM "playerStuff\addActionGatherWood.sqf";
execVM "playerStuff\addActionEviscerate.sqf";