
private ["_itemsPlayer","_nObj","_eviscerate"];

waitUntil
{
	_itemsPlayer = (backpackItems player) + (uniformItems player) + (vestItems player) + (assignedItems player);
	_nObj = nearestObject [(getPos player), "Animal"];
	
	if ((player distance _nObj <= 3) && !(alive _nObj) && ("sc_knife" in _itemsPlayer))
	then
	{
		_eviscerate = player addAction ["Eviscerate", "playerStuff\eviscerate.sqf", "", 1, true, true, "", ""];
	
		waitUntil { (player distance _nObj > 2) };
		player removeAction _eviscerate;
	};
	
	!(alive player)
};
