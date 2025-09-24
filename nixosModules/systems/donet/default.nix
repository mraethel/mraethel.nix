{
  imports = [ ./mailserver ];
  networking = {
    domain = "mraethel.de";
    hostName = "donet";
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/74104af6-e987-4e20-8d43-37cfcd7d2325";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/A4E4-40F1";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
  };
  boot.initrd = {
    availableKernelModules = [
      "ata_piix"
      "uhci_hcd"
      "virtio_pci"
      "virtio_net"
      "sr_mod"
      "virtio_blk"
    ];
    kernelModules = [ "dm-snapshot" ];
    luks.devices.cryptroot = {
      device = "/dev/disk/by-uuid/18977a69-faef-40c5-b7d2-1ee9e8f02777";
      preLVM = true;
    };
    network = {
      enable = true;
      ssh = {
        enable = true;
        shell = "/bin/cryptsetup-askpass";
        authorizedKeyFiles = [ ./authorized_keys ];
        hostKeys = [ "/etc/ssh/ssh_initrd_ed25519_key" ];
      };
    };
  };
  systemd.network.networks.ens3 = {
    address = [
      "193.26.159.48/22"
      "2a03:4000:4c:f3::1/64"
    ];
    gateway = [
      "193.26.156.1"
      "fe80::1"
    ];
  };
  system.stateVersion = "24.05";
  swapDevices = [ { device = "/dev/disk/by-uuid/3ba17294-d310-4818-8f6e-ed1a58a083ae"; } ];
  time.timeZone = "Europe/Berlin";
}
