{
  hostName = "donet";
  system = "x86_64-linux";
  stateVersion = "24.05";
  timeZone = "Europe/Berlin";
  fileSystems = import ./fileSystems;
  initrd = import ./initrd;
  luksDevices = import ./luksDevices;
  swapDevices = import ./swapDevices;
}
