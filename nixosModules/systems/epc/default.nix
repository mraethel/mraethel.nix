{
  boot = {
    initrd.availableKernelModules = [
      "ahci"
      "ehci_pci"
      "sd_mod"
      "uhci_hcd"
    ];
    loader.grub.device = "/dev/sda";
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/743b9a53-9107-4fdb-85d8-55eac5cf7154";
    fsType = "ext4";
  };
  networking.hostName = "epc";
  swapDevices = [ { device = "/dev/disk/by-uuid/76801569-1172-415e-9733-09e62815073d"; } ];
  system.stateVersion = "22.11";
  time.timeZone = "Europe/Berlin";
}
