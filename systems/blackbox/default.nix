{
  hostName = "blackbox";
  system = "x86_64-linux";
  stateVersion = "23.11";
  timeZone = "Europe/Berlin";
  fileSystems = import ./fileSystems;
  kernelModules = import ./kernelModules;
  }
