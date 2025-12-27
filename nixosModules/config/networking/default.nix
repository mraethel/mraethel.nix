{
  networking.useDHCP = false;
  services.resolved.enable = true;
  systemd.network.enable = true;
}
