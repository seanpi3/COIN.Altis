params["_object"];
player playAction "grabDrag";
	Sleep (0.01);
		waitUntil { ((AnimationState player) == "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2") || ((AnimationState player) == "AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2")}; 
			_object attachTo [player, [0,1.0,0.3]];
			player playMove "AcinPknlMwlkSrasWrflDb";

obj1attached=true;
PublicVariable "obj1attached";
objAttached = _object;

Drop1 = player addAction ["<t color=""#930909"">" +"Ablegen</t>","Detach_big.sqf",[],1,true,true,"","obj1attached"]; 

while {obj1attached} do {
	["<img size='2' image='Carry.jpg'/><br />Dragging",(safezoneX- 1.18)/2,-(safezoneH-1.15)/2,5,0,0,1000] spawn bis_fnc_dynamicText;
};