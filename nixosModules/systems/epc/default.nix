{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/743b9a53-9107-4fdb-85d8-55eac5cf7154";
    fsType = "ext4";
  };
  networking.hostName = "epc";
  boot.initrd.availableKernelModules = [
    "ahci"
    "ehci_pci"
    "sd_mod"
    "uhci_hcd"
  ];
  system.stateVersion = "22.11";
  swapDevices = [ { device = "/dev/disk/by-uuid/76801569-1172-415e-9733-09e62815073d"; } ];
  time.timeZone = "Europe/Berlin";
}
