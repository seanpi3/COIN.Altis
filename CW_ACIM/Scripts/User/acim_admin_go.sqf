_unit_row = lbCurSel 2100;
_unit_data = ((unitarray select _unit_row) select 1);
_action_row = lbCurSel 2101;
_action_data = lbData [2101, _action_row];

_param1 = ctrlText 1400;
_param2 = ctrlText 1401;
_param3 = ctrlText 1402;
_param4 = ctrlText 1403;
_param5 = ctrlText 1404;

If (isNil "_unit_data")exitWith {hint "NO UNIT SELECTED";};
If (isNil "_action_data")exitWith {hint "NO ACTION SELECTED";};

switch (_action_data) do
{
	//INFO
	case "action_01": 
	{
		If !(isNil "_param1" && "" == _param1 ) then {_unit_data setVariable ["acim_custom_name", _param1, true];};
		If !(isNil "_param2" && "" == _param2 ) then {_unit_data setVariable ["acim_custom_age", _param2, true];};
		If !(isNil "_param3" && "" == _param3 ) then {_unit_data setVariable ["acim_custom_placeofbirth", _param3, true];};
		If !(isNil "_param4" && "" == _param4) then {_unit_data setVariable ["acim_custom_interrogation", _param4, true];};
	};
	
	//ITEMS
	case "action_02":
	{
		If !(isNil "_param1" && "" == _param1 ) then {_unit_data setVariable ["acim_custom_shirtitem", _param1, true];};
		If !(isNil "_param2" && "" == _param2 ) then {_unit_data setVariable ["acim_custom_pantsitem", _param2, true];};
		If !(isNil "_param3" && "" == _param3 ) then {_unit_data setVariable ["acim_custom_shoesitem", _param3, true];};
		If !(isNil "_param4" && "" == _param4 ) then {_unit_data setVariable ["acim_custom_backpackitem", _param4, true];};
		If !(isNil "_param5" && "" == _param5 ) then {_unit_data setVariable ["acim_custom_vestitem", _param5, true];};
	};
};


