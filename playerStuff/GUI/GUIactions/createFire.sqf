
private ["_items","_fireplace"];

_items = (backpackItems player) + (uniformItems player) + (vestItems player) + (assignedItems player);


if ("sc_wood" in _items && ("sc_lighter" in _items || "sc_matchbook" in _items))
then
	{
		player playMoveNow "AinvPknlMstpSnonWrflDr_medic4";
		sleep 7;
		_fireplace = "Land_FirePlace_F" createVehicle (getPos player);
		_fireplace setPos (getPos player);
		player removeItem "sc_wood";
	}
else
	{
		hint "Wood and lighter needed!";
	};
