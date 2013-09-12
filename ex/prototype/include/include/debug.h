#define __DEBUG__

#ifdef __DEBUG__
	#ifndef SELF
		#define _SELF __FILE__
	#else
		#define _SELF SELF
	#endif
	
	#ifndef NODEBUG
		//#define DLOG(lmessage) diag_log format["%5|%4 %1:%2 %3", _SELF, __LINE__, str(lmessage), diag_frameno, time]; player globalChat str(lmessage)
		#define DLOG(lmessage) [lmessage, _SELF, __LINE__, 7] call EX_fnc_log;
	#else
		#define DLOG(lmessage) true
	#endif
#endif