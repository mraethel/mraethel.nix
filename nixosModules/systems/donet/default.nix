{
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
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A4E4-40F1";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
  boot.initrd = {
    luks.devices.cryptroot.device = "/dev/disk/by-uuid/18977a69-faef-40c5-b7d2-1ee9e8f02777";
    network.ssh.authorizedKeys = [ ''command="systemctl default" ${lib.fileContents ./ssh_initrd_ed25519_key.pub}'' ];
  };
  systemd.network.networks.ens3 = {
    name = "ens3";
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
}
