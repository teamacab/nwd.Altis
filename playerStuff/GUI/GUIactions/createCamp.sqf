
private ["_items"];

_items = (backpackItems player) + (uniformItems player) + (vestItems player) + (assignedItems player);


if ("sc_bedroll" in _items)
then
	{
		player playMoveNow "AinvPknlMstpSnonWrflDr_medic1";
		sleep 4;
		_camp = "Land_Sleeping_bag_F" createVehicle (getPos player);
		_camp setPos (getPos player);
		player removeItem "sc_bedroll";
		_repack = _camp addAction ["Pack Sleepingbag", "playerStuff\GUI\GUIactions\packCamp.sqf", "", 1, true, true, "", ""];
	}
else
	{
		hint "Sleepingbag (Bedroll) needed!";
	};
