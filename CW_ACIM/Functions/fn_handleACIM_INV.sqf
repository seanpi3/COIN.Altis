acim_fnc_handle_ACIM_INV = {
_mode = _this select 0;
_civinv = 1500;
_playerinv = 1501;
_selectedItemCiv = lbCurSel _civinv;
_selectedItemCivData = lbData [_civinv, _selectedItemCiv];
_selectedItemPlayer = lbCurSel _playerinv;
_selectedItemPlayerData = lbData [_playerinv, _selectedItemPlayer];
_cursZiv = cursorTarget;
_civWeapons = weapons _cursZiv;
_playerWeapons = weapons player;







	
SWITCH (_mode) DO	
{
	CASE "TAKE":	{
					call acim_fnc_updateUsedItemsArray;
					
					If (isNil "_selectedItemCiv" OR _selectedItemCivData == "") exitWith {hint "YOU HAVE TO SELECT SOMETHING!";};
					
					If ((!isNil "_selectedItemCiv") && (_selectedItemCivData in ACIM_INVENTORY_TEMP_USEDITEMNAMES)) exitWith {
					
					_indexPlayerInv = lbAdd[_playerinv,_selectedItemCivData];
					lbSetData [_playerinv,_indexPlayerInv, _selectedItemCivData];		
					lbDelete [_civinv,_selectedItemCiv];
					
					ACIM_Player_INV = ACIM_Player_INV + [_selectedItemCivData];
					_cursZivInvVar = _cursZiv getVariable "ACIM_CIV_INVENTORY";
					If (isNil "_cursZivInvVar")then{_cursZivInvVar = [];};
					_element = _cursZivInvVar find _selectedItemCivData;
					_cursZivInvVar deleteAt _element;
					_cursZiv setVariable ["ACIM_CIV_INVENTORY", _cursZivInvVar , true];
					};
					
					If (!isNil "_selectedItemCiv" && player canAdd _selectedItemCivData) then {
					_indexPlayerInv = lbAdd[_playerinv,_selectedItemCivData];
					lbSetData [_playerinv,_indexPlayerInv, _selectedItemCivData];		
					lbDelete [_civinv,_selectedItemCiv];
					
					_cursZiv unassignItem _selectedItemCivData;
					_cursZiv removeItem _selectedItemCivData;
					player addItem _selectedItemCivData;
					player assignItem _selectedItemCivData;
					
					_cursZivInvVar = _cursZiv getVariable "ACIM_CIV_INVENTORY";
					If (isNil "_cursZivInvVar")then{_cursZivInvVar = [];};
					_element = _cursZivInvVar find _selectedItemCivData;
					_cursZivInvVar deleteAt _element;
					_cursZiv setVariable ["ACIM_CIV_INVENTORY", _cursZivInvVar , true];
					_cursZiv setVariable ["ACIM_CIV_INVENTORY", _cursZivInvVar, true];
					};
					
					If ((!isNil "_selectedItemCiv") && (_selectedItemCivData in _civWeapons)) then {
					_indexPlayerInv = lbAdd[_playerinv,_selectedItemCivData];
					lbSetData [_playerinv,_indexPlayerInv, _selectedItemCivData];		
					lbDelete [_civinv,_selectedItemCiv];
					
					_cursZiv removeWeapon _selectedItemCivData;
					player addWeapon _selectedItemCivData;
					
					};
					};
	
	CASE "GIVE":	{
					call acim_fnc_updateUsedItemsArray;
		
					If (isNil "_selectedItemPlayer" OR _selectedItemPlayerData == "") exitWith {hint "YOU HAVE TO SELECT SOMETHING!";};
					
					If ((!isNil "_selectedItemPlayer") && (_selectedItemPlayerData in ACIM_INVENTORY_TEMP_USEDITEMNAMES)) exitWith {
					_indexCivInv = lbAdd[_civinv,_selectedItemPlayerData];
					lbSetData [_civinv,_indexCivInv, _selectedItemPlayerData];
					lbDelete [_playerinv,_selectedItemPlayer];
					
					_element = ACIM_Player_INV find _selectedItemPlayerData;
					ACIM_Player_INV deleteAt _element;
					_cursZivInvVar = _cursZiv getVariable "ACIM_CIV_INVENTORY";
					If (isNil "_cursZivInvVar")then{_cursZivInvVar = [];};
					_cursZiv setVariable ["ACIM_CIV_INVENTORY", _cursZivInvVar + [_selectedItemPlayerData], true];
					};
					
					If (!(_selectedItemPlayerData in _playerWeapons) && !(_selectedItemPlayerData in ACIM_INVENTORY_TEMP_USEDITEMNAMES) && (!isNil "_selectedItemPlayer" && _cursZiv canAdd _selectedItemPlayerData)) then {
					_indexCivInv = lbAdd[_civinv,_selectedItemPlayerData];
					lbSetData [_civinv,_indexCivInv, _selectedItemPlayerData];
					lbDelete [_playerinv,_selectedItemPlayer];
					
					player unassignItem _selectedItemPlayerData;
					player removeItem _selectedItemPlayerData;
					_cursZiv addItem _selectedItemPlayerData;
					_cursZiv assignItem _selectedItemPlayerData;
					};
					
					If ((!isNil "_selectedItemPlayerData") && (_selectedItemPlayerData in _playerWeapons)) then {
					_indexCivInv = lbAdd[_civinv,_selectedItemPlayerData];
					lbSetData [_civinv,_indexCivInv, _selectedItemPlayerData];
					lbDelete [_playerinv,_selectedItemPlayer];
					
					player removeWeapon _selectedItemPlayerData;
					_cursZiv addWeapon _selectedItemPlayerData;
					};
					};
};
};	
