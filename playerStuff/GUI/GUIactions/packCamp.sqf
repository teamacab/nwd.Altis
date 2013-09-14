
private ["_target","_caller","_id"];

_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_caller playMoveNow "AinvPknlMstpSnonWrflDr_medic1";
_target removeAction _id;
sleep 4;
deleteVehicle _target;
_caller addItem "sc_bedroll";