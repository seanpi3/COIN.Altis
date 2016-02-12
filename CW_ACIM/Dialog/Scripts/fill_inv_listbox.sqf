_civinv = 1500;
_playerinv = 1501;
_cursZiv = cursorTarget;
_CIV_INVENTORY = _cursZiv getVariable "ACIM_CIV_INVENTORY";


If (IsNil "_CIV_INVENTORY") then {_CIV_INVENTORY = [];};


{
	_indexCiv = lbAdd [_civinv, _x];
	lbSetData [_civinv, _indexCiv, _x];
}forEach (_CIV_INVENTORY);

{
	_indexPlayer = lbAdd [_playerinv, _x];
	lbSetData [_playerinv, _indexPlayer, _x];
}forEach (items player + weapons player + assignedItems player + ACIM_Player_INV);
	
