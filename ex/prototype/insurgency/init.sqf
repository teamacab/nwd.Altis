#define SELF "ex\prototype\insurgency\init.sqf"
#define PATH "ex\prototype\insurgency"
#include "include\ex.h"

if(!isServer) exitWith {};
// create triggers 

EX_fnc_populateInsurgency = {
    DLOG("Populate called! " + str(_this));
	_trigger = _this select 0;
    _location = _trigger getVariable "location";
    _side = _trigger getVariable "side";
	_radius = _trigger getVariable "radius";
	_pos = position _location;
	_objects = [];
	 
	// check if we are already running!
	_var = _trigger getVariable "trigger_running";
	if(!isNil "_var") exitWith {
		// someone re-entered the zone, update the time!
        DLOG("Exitting.");
		_trigger setVariable["trigger_running", time, false];
	}; // already running. exit here!
	 
	// set the variable to running and add the time!
	_trigger setVariable ["trigger_running", time, false];
	_amount = _radius / 100;
    DLOG("Amount: " + str(_amount));
    _amount = round(_amount / 2);
    DLOG("Amount round: " + str(_amount));
    if(_amount < 1) then { _amount = 1; };
    _aUnits = (0.05 * _radius) / _amount;
    DLOG("aUnits: " + str(_aUnits));
    _aVecs = (0.005 * _radius) / _amount;
    _validPosses = _pos nearRoads _radius;
    for "_i" from 0 to _amount do {
        DLOG("Creating militarize" + str(_i));
        _group = createGroup _side;
        _vPos = _validPosses select (floor(random (count _validPosses - 1)));
        _ac = _aUnits - 1;
		for "_n" from 0 to (round(random(_ac)) + 2) do {
        	_class = [_side, "man"] call EX_fnc_lists_getRandom;
        	_unit = _group createUnit [_class, getPosATL _vPos, [], 0, "NONE"];
            DLOG("Created " + str(_class) + " unit: " + str(_unit));
            sleep 0.05;
        };
        [_group, getPos _vPos, _radius] spawn CBA_fnc_taskPatrol;
        sleep 0.5;
	};

    for "_n" from 0 to _amount do {
        if(random(1) < 40) then {
            _type = "car";
            if(random(1) < 30) then {
              _type = "tank";  
            };
	    	_class = [_side, _type] call EX_fnc_lists_getRandom;
	        _bPos = _validPosses select (floor(random (count _validPosses - 1)));
	        DLOG("Created " + str(_class));
            _group = (createGroup _side);
	    	[getPos _bPos, direction _bPos, _class, _group] call BIS_fnc_spawnVehicle;
            [_group, getPos _bPos, _radius] spawn CBA_fnc_taskPatrol;
	        sleep 0.05;
        };
    };

	// THIS HAS TO BE ONE OF THE LAST LINES!!!!
	// we need all created objects later on to delete them if
	// players have left the locations for X minutes.
	// must be handled in EX_fnc_cleanInsurgency!
	_trigger setVariable["created_objects", _objects, false]; // DO NOT FORGET THIS!!!!!!!!
	 
};
 
EX_fnc_cleanInsurgency = {
    DLOG("Clean called! " + str(_this));
	_trigger = _this select 0;
    _location = _trigger getVariable "location";
    _side = _trigger getVariable "side";
	_radius = _trigger getVariable "radius";
	_timeout = 20; // if no player was in the zone for this value, everything gets cleared.
	_time = time;
	_var = _trigger getVariable "trigger_running";
	if(isNil "_var") exitWith {
        DLOG("trigger is not running.");
    }; // should never be true, but you never know...
	sleep _timeout;
	_refetch = _trigger getVariable "trigger_running";
	if(_var != _refetch) exitwith {
        DLOG("Some reactivated");
    }; // someone reactivated in the meantime.
	 DLOG("CLEANING!");
	// okay, clean up!
	_objects = _trigger getVariable "created_objects";
	// delete 'em all or.. do whatever you want.
	{
		deleteVehicle _x;
	} foreach _objects;
};
 
EX_fnc_findMapCenter = {
	[0, 0, 0]
};
 
EX_fnc_createLocationTrigger = {
	private ["_pos", "_radius"];
	_location = _this select 0;
	_radius = _this select 1;
	_side = _this select 2;
	_pos = position _location;
	_trg = createTrigger ["EmptyDetector", _pos];
    _trg setVariable["location", _location, false];
    _trg setVariable["radius", _radius, false];
    _trg setVariable["side", _side, false];
	_trg setTriggerArea [_radius, _radius, 0, false];
	_trg setTriggerActivation ["ANY", "PRESENT", true];
	_cond = "_c = false; { if(isPlayer _x) exitWith { _c = true }; } foreach thislist; _c";
	_activation = format["[thistrigger] spawn EX_fnc_populateInsurgency;"];
	_deactivation = format["[thistrigger] spawn EX_fnc_cleanInsurgency;"];
	_trg setTriggerStatements [_cond, _activation, _deactivation];
	 
	_trg; // return the trigger for whatever reasons.
	 
};
 
EX_fnc_addLocationTrigger = {
	_locations = _this select 0;
	_radius = _this select 1;
	_side = _this select 2;
	{
        _name = text _x;
        DLOG("Creating location for " + str(_name) + "; " + str(_x));
		[_x, _radius, _side] call EX_fnc_createLocationTrigger;
	} foreach _locations;
};
// create a trigger on all locations
_center = call EX_fnc_findMapCenter;
_villages = nearestLocations [_center, ["NameVillage"], 100000];
_cities = nearestLocations [_center, ["NameCity"], 100000];
_capitals = nearestLocations [_center, ["NameCityCapital"], 100000];
 
[_villages, 200, WEST] call EX_fnc_addLocationTrigger;
[_cities, 500, WEST] call EX_fnc_addLocationTrigger;
[_capitals, 1000, WEST] call EX_fnc_addLocationTrigger;