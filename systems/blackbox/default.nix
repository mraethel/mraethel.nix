{
  fileSystems = import ./fileSystems;
  grubDevice = "/dev/sda";
  hostName = "blackbox";
  initrd = import ./initrd;
  kernelModules = [ "kvm-amd" ];
  stateVersion = "23.11";
  system = "x86_64-linux";
  timeZone = "Europe/Berlin";
}
