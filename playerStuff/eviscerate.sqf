
private ["_target","_caller","_id","_meatSource","_meatHolder"];

_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_meatSource = nearestObject [(getPos _target), "Animal"];

_target playMoveNow "AinvPknlMstpSnonWnonDnon_medic4";
sleep 11;
_meatHolder = createVehicle ["GroundWeaponHolder", (getPos _meatSource), [], 0 , "CAN_COLLIDE"];
_meatHolder addItemCargoGlobal ["sc_rawmeat",4];
sleep 1;
_target removeAction _id;
deleteVehicle _meatSource;


