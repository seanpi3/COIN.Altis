fn_prioritySelect = {
	if(typeName _this != "ARRAY")exitWith{
		diag_log format["ERROR: Type %1, expected Array", str typeName _this];
	};
	_arr = _this;
	_ran = ceil(random 10);
	while{{_ran in _x}count _arr < 1}do{_ran = _ran -1};
	
	_sel = _arr select random (count _arr -1);
	while{_sel select 1 < _ran}do{
		_sel = _arr select random (count _arr -1);
	};
	_return = _sel select 0;
	
	_return
};