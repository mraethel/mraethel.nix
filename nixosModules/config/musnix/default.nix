{
  config,
  ...
}: {
  musnix = {
    enable = true;
    alsaSeq.enable = true;
    kernel.realtime = true;
    rtirq.enable = true;
    das_watchdog.enable = true;
  };
  security.rtkit.enable = config.musnix.enable;
}
