{
  hostName = "donet";
  system = "x86_64-linux";
  stateVersion = "24.05";
  timeZone = "Europe/Berlin";
  fileSystems = import ./fileSystems;
  kernelModules = import ./kernelModules;
  luksDevices = import ./luksDevices;
  swapDevices = import ./swapDevices;
}
