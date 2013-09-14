
private ["_items","_fireplace"];

_items = (backpackItems player) + (uniformItems player) + (vestItems player) + (assignedItems player);
_fireplace = nearestObject [player, "Land_FirePlace_F"];

if ("sc_rawmeat" in _items && (player distance _fireplace) <= 3)
then
	{
		_cnt = {_x == "sc_rawmeat"} count _items;
		
		for "_i" from 0 to (_cnt - 1) do
		{
			player playMoveNow "AinvPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon";
			player removeItem "sc_rawmeat";
			player addItem "sc_cookedmeat";
		};
	}
else
	{
		hint "Raw meat and fireplace needed!";
	};
