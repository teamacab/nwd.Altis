
/*
  Script by Sickboy (sb _at_ 6thSense.eu)
  Version: v0.1
  Conditions to use:

    SinglePlayer: !T_MP
    MultiPlayer: T_MP
    Dedicated Server: T_Server && !T_Client
    Dedicated Server or ServerClient: T_Server
    ClientOnly: T_Client && !T_Server
    Client or ServerClient: T_Client
    Client or ServerClient, NOT JIP: T_Client && !T_JIP
    JIP Client: T_JIP 

*/
onPlayerConnected "[_id, _name] execVM ""ex\onPlayerConnected.sqf""";
onPlayerDisconnected "[_id, _name] call compile preprocessFileLineNumbers ""ex\onPlayerDisconnected.sqf""";


T_INIT = false;
T_Server = false; T_Client = false; T_JIP = false;

if (playersNumber east + playersNumber west + playersNumber resistance + playersNumber civilian > 0) then { T_MP = true } else { T_MP = false };

if (isServer) then
{
  T_Server = true;
  if (!(isNull player)) then { T_Client = true };
  T_INIT = true;
} else {
  T_Client = true;
  if (isNull player) then
  {
      T_JIP = true;
      [] spawn { waitUntil { !(isNull player) }; T_INIT = true };
  } else {
      T_INIT = true;
  };
};

call compileFinal preprocessFileLineNumbers "ex\init.sqf";

finishMissionInit;