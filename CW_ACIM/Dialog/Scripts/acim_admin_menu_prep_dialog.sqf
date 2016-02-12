_style = _this select 0;

SWITCH(_style)do
{
	CASE "HIDE_ALL": 	{
							ctrlShow [1003, false];
							ctrlShow [1004, false];
							ctrlShow [1005, false];
							ctrlShow [1006, false];
							ctrlShow [1007, false];
							ctrlShow [1008, false];
							
							ctrlShow [1400, false];
							ctrlEnable [1400, false];
							ctrlShow [1401, false];
							ctrlEnable [1401, false];
							ctrlShow [1402, false];
							ctrlEnable [1402, false];
							ctrlShow [1403, false];
							ctrlEnable [1403, false];
							ctrlShow [1404, false];
							ctrlEnable [1404, false];
						};
	
	CASE "ITEM_VARS": 	{
							ctrlShow [1003, true];
							ctrlShow [1004, true];
							ctrlShow [1005, true];
							ctrlShow [1006, true];
							ctrlShow [1007, true];
							ctrlShow [1008, true];
							
							ctrlShow [1400, true];
							ctrlEnable [1400, true];
							ctrlShow [1401, true];
							ctrlEnable [1401, true];
							ctrlShow [1402, true];
							ctrlEnable [1402, true];
							ctrlShow [1403, true];
							ctrlEnable [1403, true];
							ctrlShow [1404, true];
							ctrlEnable [1404, true];
						};
						
	CASE "INFO_VARS":	{
							ctrlShow [1003, true];
							ctrlShow [1004, true];
							ctrlShow [1005, true];
							ctrlShow [1006, true];
							ctrlShow [1007, true];
							ctrlShow [1008, false];
							
							ctrlShow [1400, true];
							ctrlEnable [1400, true];
							ctrlShow [1401, true];
							ctrlEnable [1401, true];
							ctrlShow [1402, true];
							ctrlEnable [1402, true];
							ctrlShow [1403, true];
							ctrlEnable [1403, true];
							ctrlShow [1404, false];
							ctrlEnable [1404, false];
						};
};