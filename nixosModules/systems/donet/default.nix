{
  config,
  lib,
  ...
}: {
  imports = [
    ./harmonia
    ./mailserver
    ./nginx
    ./vaultwarden
  ];
  networking = {
    domain = "mraethel.de";
    firewall.allowedTCPPorts = [ 22 80 443 ];
    hostName = "donet";
  };
  fileSystems = {
    "/" = {
      device = "/dev/mapper/crypt-root";
      fsType = "ext4";
      options = [ "x-systemd.device-timeout=infinity" ];
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
  boot = {
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_net"
        "sr_mod"
        "virtio_blk"
      ];
      kernelModules = [ "dm-snapshot" ];
      luks.devices.cryptroot.device = "/dev/disk/by-uuid/18977a69-faef-40c5-b7d2-1ee9e8f02777";
      network = {
        ssh = {
          enable = true;
          authorizedKeys = [ ''command="systemctl default" ${lib.fileContents ./ssh_initrd_ed25519_key.pub}'' ];
          hostKeys = [ "/etc/ssh/ssh_initrd_ed25519_key" ];
        };
      };
      systemd.network.enable = true;
    };
    kernelParams = let
      net = config.systemd.network.networks;
      iface = net.ens3;
      cidr = builtins.head iface.address;
      addr = builtins.head (lib.strings.splitString "/" cidr);
      gw = builtins.head iface.gateway;
      hostName = config.networking.hostName;
    in [ "ip=${ addr }::${ gw }:255.255.252.0:${ hostName }:${ iface.name }:off" ];
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
    name = "ens3";
  };
  system.stateVersion = "24.05";
  swapDevices = [{
    device = "/dev/mapper/crypt-swap";
    options = [ "x-systemd.device-timeout=infinity" ];
  }];
  time.timeZone = "Europe/Berlin";
}
