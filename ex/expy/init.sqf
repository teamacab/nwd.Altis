#define SELF "ex\expy\init.sqf"
#define PATH "ex\expy"
#include "include\ex.h"
#include "include\expy.h"

private ["_expyVersion"];
// init
("Arma2Net.Unmanaged" callExtension "Unload");
("Arma2Net.Unmanaged" callExtension "Load");
PY("import ex");
_expyVersion = PY("ex.version()");
DLOG("Loading EXPY " + str(_expyVersion));

["onEachFrame", {
	private "_py";
	_py = format["ex.RVEngine.FrameNo = %1; ex.RVEngine.FPS = %2; ex.RVEngine.FPS_MIN = %3; ex.RVEngine.TickTime = %4; ex.RVEngine.Time = %5", diag_frameno, diag_fps, diag_fpsmin, diag_tickTime, time];
	PY(_py);
}] call CBA_fnc_addEventHandler;


["ex_network_opc", {
	if(!isServer) exitWith {};
	private ["_player"];
	_player = _this select 0;
	removeAllItems _player;
	removeAllWeapons player;
	removeHeadgear player;
	removeBackpack player;
	removeUniform player;
	removeVest player;
	_py = format["ex.loadPlayer('%2', '%1')", getPlayerUID _player, netid _player];
	_res = PY(_py);
	
}] call CBA_fnc_addEventHandler;
	

EX_fnc_addUnitEvents = {
	private ["_unit"];
	_unit = _this select 0;
	
	
	
};

EX_py_createPlayer = {
	private ["_player", "_uid", "_py"];
	_player = _this select 0;
	_uid = getPlayerUID _player;
	_py = format["ex.createPlayer('%1', '%2')", _uid, netid _player];
	[_player] call EX_py_createUnit;
};
EX_py_createUnit = {
	private ["_unit", "_vars", "_netid", "_arg", "_py"];
	_unit = PARAM(0, nil);
	_vars = [_unit] call EX_fnc_getAllVariables;
	_netid = netid _unit;
	_arg = [
		['netid', _netid],
		['clazz', typeOf _unit],
		['posATL', getPosATL _unit],
		['posASL', getPosASL _unit],
		['animation', animationState _unit],
		['damage', damage _unit],
		['alive', alive _unit],
		['weapons', weapons _unit],
		['magazines', magazines _unit],
		['items', items _unit],
		['headgear', headgear _unit],
		['uniform', uniform _unit],
		['vest', vest _unit],
		['backpack', backpack _unit],
		['backpackCargo', backpackCargo _unit],
		['uniformItems', uniformItems _unit],
		['vestItems', vestItems _unit],
		['vehicle', vehicle _unit],
		['variables', _vars],
		['rank', rank _unit],
		['skill', skill _unit]
	];
	
	{
		_var = _x select 0;
		_val = _x select 1;
		_py = format["ex.getUnit('%1').%2 = '%3'", _netid, _var, _val];
		DLOG(str(_py));
		PY(_py);
		
	} foreach _arg;
	
	_id = _unit addEventHandler ["Dammaged", {
		_unit = _this select 0;
		_str = format["ex.getUnit('%1').damage = '%2'", netid _unit, damage _unit];
		PY(_str);
	}];
	_id = _unit addEventHandler ["AnimStateChanged", {
		_unit = _this select 0;
		_anim = _this select 1;
		_str = format["ex.getUnit('%1').animation = '%2'", netid _unit, _anim];
		PY(_str);
	}];
	
	
	_unit spawn {
		private "_unit";
		_unit = _this;
		waitUntil {
			_str = format["ex.getUnit('%1').posATL = '%2'", netid _unit, getPosATL _unit];
			_str = format["ex.getUnit('%1').posASL = '%2'", netid _unit, getPosASL _unit];
			PY(_str);
			sleep 0.05;
			isNull _unit;
		};
	};
	
};



EX_py_call = {
		private ["_function", "_arguments", "_callback", "_ret"];
		_function = PARAM(0, nil);
		_arguments = PARAM(1, []);
		_callback = PARAM(2, nil);
		
		if(isNil "_function") exitWith {};
		
		//DLOG("Calling EX function " + str(_function) + " with arguments " + str(_arguments));
		_str = "";
		if(count(_arguments) == 0) then {
			_str = format["ex.%1()", _function];
		} else {
			_tmp = "";
			_s = count(_arguments) - 1;
			_i = 0;
			{
				_arg = format["'%1'", _x];
				_tmp = format["%1%2", _tmp, _arg];
				if(_i != _s) then {
					_tmp = format["%1,", _tmp];
				};
				_i = _i + 1;
			} foreach _arguments;
			_str = format["ex.%1(%2)", _function, _tmp];
		};
		//DLOG(_str);
		_ret = PY(_str);
		//DLOG("result: " + str(_ret));
		
		if(!isNil "_callback") then {
			_ret spawn _callback;
		};
		_ret;
};

// spawn queue worker
[] spawn {
	waitUntil {
		_next = PY("ex.RVEngine.next()");
		_res = call compile _next;
		
		_res2 = call compile _res;
		
		_callback = _res2 select 0;
		
		_code = call (_res2 select 1);
		
		if(! isNil "_code") then {
			/*
			DLOG("next: " + str(_next));
			DLOG("r1: " + str(_res));
			DLOG("r2: " + str(_res2));
			DLOG("callback: " + str(_callback));
			DLOG("code: " + str(_code));
			DLOG("Executed command " + str(_callback) + " returned " + str(_code));
			*/
			if(_callback != "") then {
				_py = format["%1('%2')", _callback, _code];
				//DLOG("Sending callback");
				PY(_py);
			};
		};
		
		sleep 0.01;
		false;
	};
};