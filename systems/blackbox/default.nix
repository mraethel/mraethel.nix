{
  system = "x86_64-linux";
  stateVersion = "23.11";
  timeZone = "Europe/Berlin";
  fileSystems = import ./fileSystems;
  initrd = import ./initrd;
  kernelModules = [ "kvm-amd" ];
  grubDevice = "/dev/sda";
  networking = import ./networking;
}
