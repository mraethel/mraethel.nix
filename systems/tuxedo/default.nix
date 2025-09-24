{
  emulatedSystems = [ "aarch64-linux" ];
  fileSystems = import ./fileSystems;
  hostName = "tuxedo";
  initrd = import ./initrd;
  kernelModules = [
    "kvm-amd"
    "pkcs8_key_parser"
  ];
  luksDevices = import ./luksDevices;
  stateVersion = "23.11";
  system = "x86_64-linux";
  timeZone = "Europe/Berlin";
}
