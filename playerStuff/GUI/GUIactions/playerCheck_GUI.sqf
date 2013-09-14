

waitUntil
{
	_items = (backpackItems player) + (uniformItems player) + (vestItems player) + (assignedItems player);

	_skill = "N.A.";
	_cntFood = {_x == "sc_cookedmeat" || _x == "sc_mre" || _x == "sc_cannedfood" || _x == "sc_carrot" || _x == "sc_chips" || _x == "sc_donut"} count _items;
	_cntDrink = {_x == "sc_soda" || _x == "sc_waterbottle" || _x == "sc_juicebox" || _x == "sc_coffee" || _x == "sc_beer" || _x == "sc_energy_drink"} count _items;
	_cash = [player, "cash"] call EX_fnc_getVariable;
	if(isNil "_cash") then {
        _cash = 100;
    	[player, "cash", _cash] call EX_fnc_setVariable;
    };
	_food = [player, "food"] call EX_fnc_getVariable;
	if(isNil "_food") then {
        _food = 1;
    	[player, "food", _food] call EX_fnc_setVariable;
    };
	_drink = [player, "drink"] call EX_fnc_getVariable;
	if(isNil "_drink") then {
        _drink = 1;
        [player, "drink", _drink] call EX_fnc_setVariable;
    };

	ctrlSetText [1000, format ["%1", _skill]];
	ctrlSetText [1008, format ["%1x", _cntFood]];
	ctrlSetText [1009, format ["%1x", _cntDrink]];
	ctrlSetText [1012, format ["%1$", _cash]];
	
	if ("sc_knife" in _items)
	then
	{
		ctrlSetText [1201, "#(argb,8,8,3)color(0,1,0,1)"];
	}
	else
	{
		ctrlSetText [1201, "#(argb,8,8,3)color(1,0,0,1)"];
	};
	
	if ("sc_lighter" in _items || "sc_matchbook" in _items)
	then
	{
		ctrlSetText [1200, "#(argb,8,8,3)color(0,1,0,1)"];
	}
	else
	{
		ctrlSetText [1200, "#(argb,8,8,3)color(1,0,0,1)"];
	};
	
	if ("sc_bedroll" in _items)
	then
	{
		ctrlSetText [1202, "#(argb,8,8,3)color(0,1,0,1)"];
	}
	else
	{
		ctrlSetText [1202, "#(argb,8,8,3)color(1,0,0,1)"];
	};
	
	if ("ToolKit" in _items)
	then
	{
		ctrlSetText [1203, "#(argb,8,8,3)color(0,1,0,1)"];
	}
	else
	{
		ctrlSetText [1203, "#(argb,8,8,3)color(1,0,0,1)"];
	};

	if ("Medikit" in _items)
	then
	{
		ctrlSetText [1204, "#(argb,8,8,3)color(0,1,0,1)"];
	}
	else
	{
		ctrlSetText [1204, "#(argb,8,8,3)color(1,0,0,1)"];
	};
	
	if ("sc_empty_bottle" in _items)
	then
	{
		ctrlSetText [1205, "#(argb,8,8,3)color(0,1,0,1)"];
	}
	else
	{
		ctrlSetText [1205, "#(argb,8,8,3)color(1,0,0,1)"];
	};

	
	
	
	playerGUIopen == 0
};