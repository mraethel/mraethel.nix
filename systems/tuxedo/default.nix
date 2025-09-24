{
  emulatedSystems = [ "aarch64-linux" ];
  fileSystems = import ./fileSystems;
  initrd = import ./initrd;
  kernelModules = [
    "kvm-amd"
    "pkcs8_key_parser"
  ];
  luksDevices = import ./luksDevices;
  networking = import ./networking;
  stateVersion = "23.11";
  system = "x86_64-linux";
  timeZone = "Europe/Berlin";
}
