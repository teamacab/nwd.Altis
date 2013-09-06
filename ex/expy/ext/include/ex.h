#include "debug.h"
#include "meta.h"
#include "remote.h"

#define ccp(path) call compile preprocessFileLineNumbers path
#define ccpf(path) call compileFinal preprocessFileLineNumbers path
#define cpf(path) compileFinal preprocessFileLineNumbers path

//#define getIndex call AVD_fnc_getIndex
/*
#define VAR(obj, var, val) obj setVariable[var, val, false]
#define setPVAR(obj, var, val) [obj, var, val] call AVD_fnc_db_setPersistentVar
#define getPVAR(obj, var, def) [obj, var, def] call AVD_fnc_db_getPersistentVar
#define makePersistent(obj) obj setVariable ["avd_persistent", true, true]
*/

#define isAdmin (serverCommandAvailable "#kick" || isServer)

#ifndef PATH
	#define PATH "ex"
#endif

#define DEPRECATED(lmessage) DLOG(lmessage)
#define COMP(file) call compile preprocessFileLineNumbers format["%1\%2", PATH, file]
#define COMPF(file) call compileFinal preprocessFileLineNumbers format["%1\%2", PATH, file]
#define THREAD(file) execVM format["%1\%2", PATH, file]
#define SPWN(file) THREAD(file)
#define PARAM(num, def) if(!isNil "_this" and count(_this) > num) then { _this select num; } else { def; }

#define x_hashSet(h, k, v) [h, k, v] call CBA_fnc_hashSet
#define x_hashGet(h, k) [h, k] call CBA_fnc_hashGet
#define x_hash() [] call CBA_fnc_hashCreate

#define ERROR(lmessage) DLOG(lmessage)

#define REAL_TIME time

#define SAFE_HOUSE_POS (SAFE_HOUSE buildingPos floor(random 5)+1) 