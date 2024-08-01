{
  hostName = "epc";
  system = "x86_64-linux";
  stateVersion = "22.11";
  timeZone = "Europe/Berlin";
  fileSystems = import ./fileSystems;
  initrd = import ./initrd;
  swapDevices = import ./swapDevices;
}
