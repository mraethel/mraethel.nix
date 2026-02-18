{
  lib,
  ...
}:
{
  boot.kernelParams = [ "copytoram" ];
  networking.hostName = "builder";
  security.sudo.execWheelOnly = true;
  services.getty.helpLine = lib.mkForce "";
  sops.secrets."harmonia".sopsFile = ./secrets.yaml;
}
