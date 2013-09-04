#define SELF "ex\common\fnc\remote.sqf"
#include "include\ex.h"

"EX_RPC_CALL" addPublicVariableEventHandler {
	private ["_code", "_arguments", "_localTo", "_callback", "_call"];
	_code = PARAM(0, {});
	_arguments = PARAM(1, { [] });
	_localTo = PARAM(2, { nil }); // run everywhere if localTo is nil.
	_callback = PARAM(3, { nil });
	
	if(! isNil "_localTo") then {
		if(! local _localTo) exitWith {}; // not for me.
	};
	
	// call the code.
	_call = _arguments call _code;
	
	if(! isNil "_callback") then {
		// send return value to callback variable
		call compile format["%1 = %2; publicVariable ""%1"";", _callback, _call];
	};
};

/**
 * Executes the given code across the network.
 * You can specify either if the code is run everywhere or on
 * a certain client where an object is local.
 *
 *	param	_code		: the code to execute
 *	param	_arguments	: the arguments as an array being supplied to the code
 *	param	_localTo	: code runs where this object is local, default nil - everywhere
 *	param	_callback	: variable to store the return value of code in, gets publicVariable'd
 *	param	_runLocal	: also run this code on the machine that is calling this function, default true
 */
EX_fnc_MPexec = {
	private ["_code", "_arguments", "_localTo", "_callback", "_runLocal", "_ret", "_call"];
	_code = PARAM(0, {});
	_arguments = PARAM(1, { [] });
	_localTo = PARAM(2, { nil });
	_callback = PARAM(3, { nil });
	_runLocal = PARAM(3, { true });
	_ret = nil;
	EX_RPC_CALL = [_code, _arguments, _localTo, _callback];
	publicVariable "EX_RPC_CALL";
	
	if(_runLocal) then {
		if(! isNil "_localTo") then {
			if(! local _localTo) exitWith {};
		};
		
		_call = _arguments call _code;
		
		if(! isNil "_callback") then {
			// send return value to callback variable
			call compile format["%1 = %2;", _callback, _call];
		};
	};
	_ret;
	
};