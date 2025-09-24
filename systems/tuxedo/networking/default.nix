{
  hostName = "tuxedo";
  wireless.iwd = {
    enable = true;
    settings = {
      General.AddressRandomization = "network";
      Scan.DisablePeriodicScan = true;
    };
  };
}
