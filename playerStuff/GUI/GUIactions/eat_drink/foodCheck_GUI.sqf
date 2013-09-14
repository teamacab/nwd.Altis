
private ["_items","_itemsFood","_itemsDrink","_sizeF","_sizeD"];

_items = (backpackItems player) + (uniformItems player) + (vestItems player);
_itemsFood = [["Canned food","sc_cannedfood"],["Carrot","sc_carrot"],["Chips","sc_chips"],["Donut","sc_donut"],["MRE","sc_mre"],["Steak","sc_cookedmeat"]];
_itemsDrink = [["Juicebox","sc_juicebox"],["Soda","sc_soda"],["Water","sc_waterbottle"],["Energy Drink","sc_energy_drink"],["Beer","sc_beer"],["Coffee","sc_coffee"]];
_sizeF = count _itemsFood;
_sizeD = count _itemsDrink;

	{
		
		if ((_x select 1) in _items)
		then
			{
			
			_index = lbAdd [15001, format ["%1",_x select 0]];
			lbSetData [15001, _index, _x select 1];
			}
		else
			{};
	} forEach _itemsFood;

	{
		
		if ((_x select 1) in _items)
		then
			{
			
			_index = lbAdd [15011, format ["%1",_x select 0]];
			lbSetData [15011, _index, _x select 1];
			}
		else
			{};
	} forEach _itemsDrink;



waitUntil
{	
	_items = (backpackItems player) + (uniformItems player) + (vestItems player);
	_sel1 = lbCurSel 15001;
	_foodSel = lbData [15001, _sel1];
	_sel2 = lbCurSel 15011;
	_drinkSel = lbData [15011, _sel2];

	
	_foodVar = [player, "food"] call EX_fnc_getVariable;
	_drinkVar = [player, "drink"] call EX_fnc_getVariable;
	_cntFood = {_x == _foodSel} count _items;
	_cntDrink = {_x == _drinkSel} count _items;
	
	if !(_foodSel in _items)
	then
		{
			lbDelete [15001, _sel1];
		};
	if !(_drinkSel in _items)
	then
		{
			lbDelete [15011, _sel2];
		};


	ctrlSetText [10041, format ["%1", (_foodVar * 100)]];
	ctrlSetText [10051, format ["%1", (_drinkVar * 100)]];
	ctrlSetText [10071, format ["%1", _cntFood]];
	ctrlSetText [10091, format ["%1", _cntDrink]];



	foodGUIopen == 0
};