{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "rtsx_usb_sdmmc"
        "sd_mod"
        "usb_storage"
        "xhci_pci"
      ];
      luks.devices.cryptroot = {
        crypttabExtraOpts = [ "fido2_device=auto" ];
        device = "/dev/disk/by-uuid/488865bd-36be-4609-84ea-ec45c568c540";
      };
      systemd.enable = true;
    };
    kernelModules = [
      "kvm-amd"
      "pkcs8_key_parser"
    ];
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/37b5eb0a-aec1-4836-b3fd-0f27bdd010c8";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/C6DC-F881";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
  };
  networking.hostName = "tuxedo";
  system.stateVersion = "23.11";
  systemd.network.networks.wlan0 = {
    name = "wlan0";
    DHCP = "yes";
  };
  time.timeZone = "Europe/Berlin";
}
