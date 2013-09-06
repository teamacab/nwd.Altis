#define SELF "ex\common\fnc\debug.sqf"
#include "include\ex.h"
//#include "include\params.h"

EX_fnc_log = {
  private ["_message", "_broadcast", "_enabled", "_level", "_format", "_name", "_broadcasted", "_line"];
  _message = PARAM(0, nil);
  _name = PARAM(1, "NOT SET, PLEASE FIX!");
  _line = PARAM(2, __LINE__);
  _level = PARAM(3, 7);
  _broadcasted = PARAM(3, false);
  /*
  _enabled = missionParam("d_debug_log");
  _broadcast = missionParam("d_debug_log_server");
  if(_enabled != 1) exitWith {};
  */
  _format = format["%6 - %5|%4 %1:%2 %3", _name, _line, str(_message), diag_frameno, time, _level];
  diag_log _format; 
  
  if(hasInterface) then {
  	player globalChat str(_message)
  };
  
  /*
  if(_broadcast == 1) then {
    _format = format["%1 :: %2", player, _format]; 
   [_format,"BIS_fnc_log"] spawn BIS_fnc_MP; 
  };
  */
        
};

EX_fnc_dump = {
  private ["_object"];
  _object = PARAM(0, nil);
    
};