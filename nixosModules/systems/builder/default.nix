{
  lib,
  ...
}:
{
  boot.kernelParams = [ "copytoram" ];
  networking = {
    hostName = "builder";
    networkmanager.enable = lib.mkForce false;
  };
  security.sudo.execWheelOnly = true;
  services.getty.helpLine = lib.mkForce "";
  sops.secrets."harmonia".sopsFile = ./secrets.yaml;
  systemd.network.networks."ether" = {
    matchConfig.Type = "ether";
    networkConfig.DHCP = true;
  };
  users.users.nixos.openssh.authorizedKeys.keyFiles = [ "${./ssh_nixos_ed25519_key.pub}" ];
}
