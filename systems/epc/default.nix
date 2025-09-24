{
  fileSystems = import ./fileSystems;
  hostName = "epc";
  initrd = import ./initrd;
  stateVersion = "22.11";
  swapDevices = import ./swapDevices;
  system = "x86_64-linux";
  timeZone = "Europe/Berlin";
}
