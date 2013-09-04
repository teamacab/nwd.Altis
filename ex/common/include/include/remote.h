#define remoteCall(script, arguments) [[arguments,script],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP
#define remoteSpawn(code, arguments) DLOG("code: " + str(code) + ", args: " + str(arguments))
//[[arguments, str(code)],"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP