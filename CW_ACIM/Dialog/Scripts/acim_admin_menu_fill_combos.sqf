unitarray = [];
{If (side _x == civilian) then {unitarray = unitarray + [[((str _x) + "  -  " + name _x),_x]]};}forEach allUnits;

{
_unitname = _x select 0;
_index = lbAdd [2100, _unitname];
} foreach unitarray;

_actions = [["ADJUST UNIT INFORMATIONS","action_01"],["ADJUST UNIT ITEMS","action_02"]];
{
_actionname = _x select 0;
_actiondata = _x select 1;
_index = lbAdd [2101, _actionname];
lbSetData [2101, _index, _actiondata];
} foreach _actions;