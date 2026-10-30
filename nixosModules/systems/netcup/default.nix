{
  config,
  lib,
  ...
}:
{
  fileSystems."/" = {
    device = "/dev/mapper/crypt-root";
    fsType = "ext4";
    options = [ "x-systemd.device-timeout=infinity" ];
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
      network.ssh = {
        enable = true;
        hostKeys = [ "/etc/ssh/ssh_initrd_ed25519_key" ];
      };
      systemd.network.enable = true;
    };
    kernelParams =
      let
        net = config.systemd.network.networks;
        iface = net.ens3;
        cidr = builtins.head iface.address;
        addr = builtins.head (lib.strings.splitString "/" cidr);
        gw = builtins.head iface.gateway;
        hostName = config.networking.hostName;
      in
      [ "ip=${addr}::${gw}:255.255.252.0:${hostName}:${iface.name}:off" ];
  };
  swapDevices = [
    {
      device = "/dev/mapper/crypt-swap";
      options = [ "x-systemd.device-timeout=infinity" ];
    }
  ];
  time.timeZone = "Europe/Berlin";
}
