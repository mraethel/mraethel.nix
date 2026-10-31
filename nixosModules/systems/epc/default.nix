{
  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "ehci_pci"
        "sd_mod"
        "uhci_hcd"
        "usb_storage"
      ];
      kernelModules = [ "dm-snapshot" ];
    };
    loader.grub.device = "/dev/sda";
  };
  fileSystems = {
    "/" = {
      device = "/dev/mapper/crypt-root";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/2844-2BE6";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  };
  networking.hostName = "epc";
  swapDevices = [ { device = "/dev/mapper/crypt-swap"; } ];
  system.stateVersion = "26.05";
  time.timeZone = "Europe/Berlin";
}
