
private ["_target","_caller","_id"];

_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;


_target playMoveNow "AinvPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon";
sleep 1;
_target addItem "sc_wood";
_target removeAction _id;
