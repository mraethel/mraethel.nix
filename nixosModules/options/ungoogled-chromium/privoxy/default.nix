{
  config,
  lib,
  ...
}: let
  cfg = config.programs.chromium;
in {
  options.programs.chromium = {
    usePrivoxy = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config.programs.chromium.extraOpts = lib.optionalAttrs cfg.usePrivoxy {
    ProxySettings = {
      ProxyMode = "fixed_servers";
      ProxyServer = "http://${ config.services.privoxy.settings.listen-address }";
    };
    HttpAllowlist = lib.optionals (config.services.privoxy.enableTor) [ "[*.]onion" ];
  };
}
