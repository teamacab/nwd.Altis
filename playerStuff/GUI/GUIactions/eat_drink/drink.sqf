
private ["_items","_sel","_dVar"];

_unit = _this select 0;
_drink = [_unit, "drink"] call EX_fnc_getVariable;

_items = (backpackItems _unit) + (uniformItems _unit) + (vestItems _unit);
_sel = lbData [15011, lbCurSel 15011];
_dVar = 0;

if (_sel in _items && _drink <= 0.75)
then
	{
		_unit removeItem _sel;
		hint format ["%1 used.", lbText [15011, lbCurSel 15011]];
		_unit setVariable ["drink", (_drink + 0.25), false];
		_dVar = 1;
	}
else
	{
		if (_drink > 0.75)
		then
			{
				hint "You´re not thirsty.";
			}
		else
			{
				hint "You don´t have the selected drink.";
			};
	};

if (_sel == "sc_waterbottle" && _dVar == 1)
then
	{
		_unit addItem "sc_empty_bottle";
	};