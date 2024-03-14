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

  config.programs.chromium = lib.mkIf cfg.usePrivoxy {
    extraOpts =  {
      ProxySettings = {
        ProxyMode = "fixed_servers";
        ProxyServer = "http://${ config.services.privoxy.settings.listen-address }";
      };
      HttpAllowlist = lib.optionals (config.services.privoxy.enableTor) [ "[*.]onion" ];
    };
    searx.domain = lib.mkDefault "http://privateoz3u5utrimal2edr56j3r5caakektxxgixigdkycuxigvquid.onion";
  };
}
