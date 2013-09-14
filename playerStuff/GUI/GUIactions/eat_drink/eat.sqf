
private ["_items","_sel","_food"];

_unit = _this select 0;
_food = [_unit, "food"] call EX_fnc_getVariable;

_items = (backpackItems _unit) + (uniformItems _unit) + (vestItems _unit);
_sel = lbData [15001, lbCurSel 15001];

if (_sel in _items && _food <= 0.75)
then
	{
		_unit removeItem _sel;
		hint format ["%1 used.", lbText [15001, lbCurSel 15001]];
		_unit setVariable ["food", (_food + 0.25), false];
	}
else
	{
		if (_food > 0.75)
		then
		{
			hint "You´re not hungry.";
		}
		else
		{
			hint "You don´t have the selected food.";
		};
	};
	