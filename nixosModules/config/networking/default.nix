{
  domain ? null,
  hostName,
  networks ? { },
  ...
}:
{
  networking = {
    inherit domain hostName;
    useDHCP = false;
  };
  services.resolved.enable = true;
  systemd.network = {
    enable = true;
    inherit networks;
  };
}
