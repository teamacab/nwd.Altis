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
if(!isServer) exitWith {};
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
    if(isNil "_player" or isNull _player) exitWith { DLOG("Nil or Null player."); };
	_py = format["ex.loadPlayer('%2', '%1')", getPlayerUID _player, netid _player];
	[_py] call EX_fnc_PY;    
	[{
        DLOG("Starting DataUpdater");
        [_this, "Player"] spawn EX_fnc_DataUpdater;
    }, _player, _player] call EX_fnc_MPexec;
    
	
}] call CBA_fnc_addEventHandler;

["ex_network_opd", {
	if(!isServer) exitWith {};
	private ["_player"];
    DLOG(str(_this));
	_player = _this select 0;
    _uid = _this select 1;
    _uid = vehicleVarName _player;
	_py = format["ex.getPlayerByVarname('%1').update()", _uid];
    DLOG(str(_py));
	PY(_py);
	DLOG("Saving player on disconnect.");	
}] call CBA_fnc_addEventHandler;


/**
 * Restore unit
 */
["ex_unit_create_post", {
    

    
    private ["_unit", "_var"];
    _unit = _this select 0;
    //if(isPlayer _unit) exitWith {};
    _var = vehicleVarName _unit;
    if(_var == "") exitWith {
        
        _f = "";
        if(isPlayer _unit) then {
            _f = format["player_%1", getPlayerUID _unit];
        
        	DLOG("VARNAME: " + str(_f));
        	_unit setVehicleVarName _f;
        	call compile format["%1 = _unit; publicVariable ""%1"";", _f];
        };
    };
    
    if(!isPlayer _unit) then {
            _v = _unit getVariable "pyjarma";
            if(isNil "_v") then {
           		_py = format["ex.preloadUnit('%1', '%2', '%3')", netid _unit, _var, typeOf _unit];
           		PY(_py);
	        };
    };
        
    //_str = format["ex.loadUnit('%1', '%2')", netid _unit, _var];
    //_res = PY(_str);
    //[_unit, "Unit"] spawn EX_fnc_DataUpdater;
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
        if(_next != "0") then {
            _s = str(_next);
        	//DLOG(_s);
	        //DLOG(_next);
            _next = call compile _next;
            //DLOG(_next);
	        _spl = [_next, ":\x000:"] call CBA_fnc_split;
	        //DLOG(str(_spl))
	        if(count(_spl) == 3) then {
		        _tid = _spl select 0;
		        _cmd = _spl select 1;
		        _line = _spl select 2;
		        _callback = "";
               
		        switch(_cmd) do {
		        	case '\x00': {
		                // begin
		                _callback = _line;
		                [WORKER_QUEUE, _tid, []] call CBA_fnc_hashSet;
		            };
		            case '\x01': {
		                // end
                       // DLOG("END!!!");
		                _list = [WORKER_QUEUE, _tid] call CBA_fnc_hashGet;
		                _code = [_list, ""] call CBA_fnc_join;
                        //DLOG(_code);
                       
		                [_code, _callback] spawn {
                            //DLOG(str(_this));
		                	private ["_code", "_callback", "_result", "_py"];
		                    _code = _this select 0;
		                    _callback = _this select 1;
                            //DLOG(_code);
                            if(isNil "_code") exitWith { DLOG("Nil code."); };
                            // damn CBA.
                            _oc = _code;
                            _code = [_code, ",any", ",nil"] call CBA_fnc_replace;
                            if(isNil "_code") exitWith { _str = format["Error in code: %1", _oc]; DLOG(_str); };
                            //DLOG(str(_code));
		                    _result = [_code] call EX_fnc_call;
                            _callback = "";
		                    if(_callback == "") exitWith {};

	                    	_py = format["%1('%2')", _callback, _result];
							//DLOG("Sending callback");c
							PY(_py);  

		                };
                       	//DLOG(str(_tid) + " executed.");
		                [WORKER_QUEUE, _tid, nil] call CBA_fnc_hashSet;
		            };
		            
		            case '\x18': {
		            	// add to queue  
		                _list = [WORKER_QUEUE, _tid] call CBA_fnc_hashGet;
		                _list = _list + [_line];
		                [WORKER_QUEUE, _tid, _list] call CBA_fnc_hashSet;
		            };
		                
		        };
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

// update units, vehicles, statics
[] spawn {
    if(true) exitWith {};
	waitUntil { time > 0};
    
    	// load world.
        PY("ex.loadWorld()");
        _updateUnit = {
	      private ["_unit", "_key", "_value"];
	      _unit = _this select 0;
	      _key = _this select 1;
	      _value = _this select 2;
          //DLOG("Updating " + str(_unit) + ", key: " + str(_key) + ", value: " + str(_value));
	      _py = format["ex.getUnit('%1', '%2').%3 = '%4'", netid _unit, vehicleVarName _unit, _key, _value];
          //DLOG(str(_py));
          //PY(_py);  
          sleep 0.01;
	      
    	};    
	waitUntil {
        _time = time;
        _frames = diag_frameno;
        DLOG("Starting unit update");
      	{
			
            _var = vehicleVarName _x;
            _netid = _x;
            if(_var != "" and !isPlayer _x and local _x) then {
            	/*
                [_netid, "posATL", getPosATL _x] call _updateUnit;
                [_netid, "posASL", getPosASL _x] call _updateUnit;
                _loadout = [_x] call EX_fnc_getLoadOut;
                [_netid, "loadout", _loadout] call _updateUnit;
                [_netid, "damage", damage _x] call _updateUnit;
                [_netid, "dir", getDir _x] call _updateUnit;
                [_netid, "animation", animationState _x] call _updateUnit;
                [_netid, "side", side _x] call _updateUnit;
                [_netid, "rank", rank _x] call _updateUnit;
                [_netid, "skill", skill _x] call _updateUnit;
                [_netid, "alive", alive _x] call _updateUnit;
                [_netid, "clazz", typeOf _x] call _updateUnit;
				*/
                _netid = netid _x;
                _posATL = getPosATL _x;
                _posASL = getPosASL _x;
                _loadout = [_x] call EX_fnc_getLoadOut;
                _damage = damage _x;
                _anim = animationState _x;
                _side = side _x;
                _rank = rank _x;
                _skill = skill _x;
                _alive = alive _x;
                _str = format["ex.updateUnit('%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8', '%9', '%10', '%11')", _netid, _var, _posATL, _posASL, _loadout, _damage, _anim, _side, _rank, _skill, _alive];
                _res = PY(_str);
                //DLOG(_res);
            };
            sleep 0.01;
        } foreach allUnits + allDead;
      	_took = time - _time;
        _frames = diag_frameno - _frames;
        _str = format["Update took %1 seconds, frames passed: %2", _took, _frames];
        DLOG(_str);
      	sleep 20;
        false;  
    };
};


EXPY_INIT=true;
publicVariable "EXPY_INIT";