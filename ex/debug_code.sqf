//_result = ("Arma2Net.Unmanaged" callExtension "Py from ex import ex");
//_result = ("Arma2Net.Unmanaged" callExtension "Py ex.LoadDB()");
#include "include\expy.h"
#include "include\ex.h"
/*
_result = ("Arma2Net.Unmanaged" callExtension "Unload");
_result = ("Arma2Net.Unmanaged" callExtension "Load");
_result = ("Arma2Net.Unmanaged" callExtension "py from ex import ex");
_result = ("Arma2Net.Unmanaged" callExtension "py ex.start()");
_result = ("Arma2Net.Unmanaged" callExtension "py ex.createUnit('test')");
*/




//_result = ["version"] call EX_py_call;
_result = PY("ex.version()");

for "_i" from 0 to 100 do {
	_unit = (group player) createUnit["C_man_1", getPos player, [], 0, "none"];
	_unit setVehicleVarName format["autogen_%1", _i];
};

//_str = format["ex.savePlayers()", diag_frameno];
_str = format["ex.a('%1')", player];
_result = PY(_str);

//_result = PY("import sys; sys.path = ['.', 'D:\\SteamLibrary\\SteamApps\\common\\Arma 3\\@Arma2Net\\Lib', 'D:\\SteamLibrary\\SteamApps\\common\\Arma 3\\@Arma2Net\\DLLs', 'D:\\SteamLibrary\\SteamApps\\common\\Arma 3\\@Arma2Net\\Python', 'D:\\SteamLibrary\\SteamApps\\common\\Arma 3\\@Arma2Net\\Python\\Lib']; import ex");
DLOG(_result);
//hint format["res: %1", _result];

//_unit = (group player) createUnit["C_man_1", getPos player, [], 0, "none"];
/*
_str = format["getUnit('%1').to_sqf", netid player];
_result = [_str, []] call EX_py_call;
DLOG(_result);
hint format["Callback is: %1", _result];
[] spawn {
for "_i_" from 0 to 100 do {
	DLOG("Asking for time");
	_py = 'ex.RVEngine.execute("time", "ex.test1")';
	_res = PY(_py);
	DLOG("RES: " + str(_res));
	sleep 20;
};
};


for "_i" from 0 to 1 do {
	_unit = (group player) createUnit["C_man_1", getPos player, [], 0, "none"];
	//[_unit] joinSilent grpNull;
	for "_i" from 0 to 1 do {
		_u = (group _unit) createUnit["C_man_1", getPos _unit, [], 0, "none"];
		
	};
};
*/
//hint str(count(allUnits));