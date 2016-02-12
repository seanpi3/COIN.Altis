obj1attached=false;
[] spawn {
   {Player removeaction Drop1} forEach allUnits;
}; 
detach objAttached; player playMoveNow "AmovPknlMstpSrasWrflDnon";
objAttached setpos [getpos objAttached select 0,getpos objAttached select 1,0]; 
objAttached = objNull;
