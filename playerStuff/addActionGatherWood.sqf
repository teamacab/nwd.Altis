
private ["_nObj","_split","_split1","_gatherWood"];		//kann hier glaub ich raus?!

waitUntil
{
	_nObj = nearestObjects [getPos player, [], 3];
		
	{
	_split = [str(_x),"ficus"] call CBA_fnc_split;
	_split1 = [str(_x),"pinus"] call CBA_fnc_split;

	if (count _split > 1 || count _split1 > 1)
		then
		{
			_gatherWood = player addAction ["Gather wood", "playerStuff\gatherWood.sqf", "", 1, true, true, "", ""];
			waitUntil { (player distance _x > 3) };
			player removeAction _gatherWood;
		};
	} forEach _nObj;
		
	!(alive player)
};
