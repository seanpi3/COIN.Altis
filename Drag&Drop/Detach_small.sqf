obj1attached2=false;
[] spawn {
   {Player removeaction Drop2} forEach allUnits;
}; 
detach objAttached; player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
objAttached setpos (player modelToWorld [0,1,0]); 
objAttached = objNull;
