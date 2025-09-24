{
  config,
  ...
}:
{
  musnix = {
    enable = true;
    alsaSeq.enable = true;
    rtirq.enable = true;
    das_watchdog.enable = true;
  };
  security.rtkit.enable = config.musnix.enable;
}
