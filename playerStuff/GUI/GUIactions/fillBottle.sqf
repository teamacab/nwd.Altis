
private ["_items"];

_items = (backpackItems player) + (uniformItems player) + (vestItems player);

if !("sc_empty_bottle" in _items) exitWith	{ hint "No Waterbottle!"; };

private ["_nObj", "_splitVar"];

_nObj = nearestObjects [getPos player, [], 5];
_splitVar = 0;

{
	_split = [str(_x),"water_source"] call CBA_fnc_split;
	_split1 = [str(_x),"watertank"] call CBA_fnc_split;
	_split2 = [str(_x),"barrelwater"] call CBA_fnc_split;
	_split3 = [str(_x),"waterbarrel"] call CBA_fnc_split;
	
if (count _split > 1 || count _split1 > 1 || count _split2 > 1 || count _split3 > 1)
then
	{
		_splitVar = 1;
	};

} forEach _nObj;

if (_splitVar == 1)
then
	{
		player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		sleep 0.85;
		player removeItem "sc_empty_bottle";
		player addItem "sc_waterbottle";
		hint "Bottle filled.";
	}
else
	{
		hint "No watersource near!";
	};