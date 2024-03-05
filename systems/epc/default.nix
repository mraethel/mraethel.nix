{
  hostname = "epc";
  system = "x86_64-linux";
  stateVersion = "22.11";
  timeZone = "Europe/Berlin";
  fileSystems = import ./fileSystems;
  kernelModules = import ./kernelModules;
  swapDevices = import ./swapDevices;
}
