{
  domain = "mraethel.de";
  fileSystems = import ./fileSystems;
  hostName = "donet";
  initrd = import ./initrd;
  luksDevices = import ./luksDevices;
  mailserver = import ./mailserver;
  networks = import ./networks;
  stateVersion = "24.05";
  swapDevices = import ./swapDevices;
  system = "x86_64-linux";
  timeZone = "Europe/Berlin";
}
