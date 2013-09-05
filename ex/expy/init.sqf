/**
 * EXPY Python Interface
 * 
 * Allows the biderctional communcation with the @Arma2NET Python plugin using
 * the 'ex' python module.
 * 
 * It keeps the ex python engine in sync with the arma engine and
 * provides several functions to cross-communicate with python modules,
 * mainly using the ex module.
 */
#define SELF "ex\expy\init.sqf"
#define PATH "ex\expy"
#include "include\ex.h"
#include "include\expy.h"

private ["_expyVersion"];

// ensure the arma2net python vm is 'fresh'
("Arma2Net.Unmanaged" callExtension "Unload");
("Arma2Net.Unmanaged" callExtension "Load");

// load the python ex module
PY("import ex");
PY("from ex.rvengine import RVEngine");
PY("ex.inArma = True");

_expyVersion = PY("ex.version()");
DLOG("EXPY " + str(_expyVersion) + " loaded.");


/**
 * Keep the time and some diag values in sync with the ex python engine.
 * Updates are performend onEachFrame.
 */
["onEachFrame", {
	private "_py";
	_py = format["ex.RVEngine.FrameNo = %1; ex.RVEngine.FPS = %2; ex.RVEngine.FPS_MIN = %3; ex.RVEngine.TickTime = %4; ex.RVEngine.Time = %5", diag_frameno, diag_fps, diag_fpsmin, diag_tickTime, time];
	PY(_py);
}] call CBA_fnc_addEventHandler;


/**
 * load the player data on join
 */
["ex_network_opc", {
	if(!isServer) exitWith {};
	private ["_player"];
	_player = _this select 0;
	_py = format["ex.loadPlayer('%2', '%1')", getPlayerUID _player, netid _player];
	_res = PY(_py);
	
}] call CBA_fnc_addEventHandler;

/**
 * This function is being called from the XEH init eventhandler.
 * 
 * It
 */	
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
		_py = format["ex.getUnit('%1').%2 = '%3'", vehicleVarName _unit, _var, _val];
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





// spawn queue worker
WORKER_QUEUE = [] call CBA_fnc_hashCreate;

[] spawn {
	waitUntil {
		_next = PY("RVEngine.next()");
        DLOG(_next);
        _spl = [_next, ":\0000:"] call CBA_fnc_split;
        DLOG(str(_spl))
        _tid = _spl select 0;
        _cmd = _spl select 1;
        _line = _spl select 2;
        _callback = nil;
        switch(_cmd) do {
        	case '\000': {
                // begin
                _callback = _line;
                [WORKER_QUEUE, _tid, []] call CBA_fnc_hashSet;
            };
            case '\001': {
                // end
                _list = [WORKER_QUEUE, _tid] call CBA_fnc_hashGet;
                _code = [_list, ""] call CBA_fnc_join;
                [_code, _callback] spawn {
                	private ["_code", "_callback", "_result", "_py"];
                    _code = _this select 0;
                    _callback = _this select 1;
                    _result = call compile _code;
                    if(! isNil "_callback") then {
                        if(_callback == "") exitWith {};
                    	_py = format["%1('%2')", _callback, _result];
						//DLOG("Sending callback");c
						PY(_py);  
                    };
                };
                [WORKER_QUEUE, _tid, nil] call CBA_fnc_hashSet;
            };
            
            case '\030': {
            	// add to queue  
                _list = [WORKER_QUEUE, _tid] call CBA_fnc_hashGet;
                _list = _list + [_line];
                [WORKER_QUEUE, _tid, _list] call CBA_fnc_hashSet;
            };
                
        };
        
        /*
		_res = call compile _next;
		
		_res2 = call compile _res;
		
		_callback = _res2 select 0;
		
		_code = call (_res2 select 1);
		
		if(! isNil "_code") then {
	
			DLOG("next: " + str(_next));
			DLOG("r1: " + str(_res));
			DLOG("r2: " + str(_res2));
			DLOG("callback: " + str(_callback));
			DLOG("code: " + str(_code));
			DLOG("Executed command " + str(_callback) + " returned " + str(_code));
			if(_callback != "") then {
				_py = format["%1('%2')", _callback, _code];
				//DLOG("Sending callback");
				PY(_py);
			};
		};
		*/
		sleep 0.01;
		false;
	};
};