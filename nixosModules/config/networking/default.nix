{
  networking.useDHCP = false;
  services.resolved.enable = true;
  systemd.network = {
    enable = true;
    networks.wlan0 = {
      name = "wlan0";
      DHCP = "yes";
    };
  };
}
