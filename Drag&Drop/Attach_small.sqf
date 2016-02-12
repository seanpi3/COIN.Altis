params["_object"];
player playAction "PutDown";
	Sleep (0.01);
		waitUntil { ((AnimationState player) == "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon")}; 
			_object attachTo [player, [-0.15,-0.15,0.15],"Pelvis"]; 
			_object setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];

obj1attached2=true;
PublicVariable "obj1attached2";
objAttached = _object;

Drop2 = player addAction ["<t color=""#930909"">" +"Ablegen</t>","Objects\Detach_small.sqf",[],1,true,true,"","obj1attached2"]; 

while {obj1attached2} do {
	["<img size='2' image='CarryBack.jpg'/><br />Carrying",(safezoneX- 1.18)/2,-(safezoneH-1.15)/2,5,0,0,1000] spawn bis_fnc_dynamicText;
};