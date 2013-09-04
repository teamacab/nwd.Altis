#define EXPY(function, params) ("Arma2Net.Unmanaged" callExtension format["py ex.%1('%2')", function,params]);
#define PY(code) ("Arma2Net.Unmanaged" callExtension format["py %1", code]);