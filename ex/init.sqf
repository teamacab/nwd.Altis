#define self "ex\init.sqf"
#define PATH "ex"
#include "include\ex.h"

if(isServer) then {
	// load server
	COMPF("server\init.sqf");
};

if(!isDedicated) then {
	// load client
	COMPF("client\init.sqf");
}