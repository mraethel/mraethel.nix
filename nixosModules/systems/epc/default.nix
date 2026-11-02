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
      luks.devices.cryptroot = {
        crypttabExtraOpts = [ "fido2_devices=auto" ];
        device = "/dev/disk/by-uuid/b18b9ba1-a643-4e86-80a8-6b8c7cf7596b";
      };
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
