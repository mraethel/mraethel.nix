{
  config,
  lib,
  ...
}: let
  cfg = config.services.searx;
in {
  options.services.searx.proxies.tor = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    port = lib.mkOption {
      type = lib.types.port;
      default = 9064;
    };
  };

  config.services = lib.mkIf cfg.proxies.tor.enable {
    searx.settings.outgoing = {
      proxies."all://" = [ "socks5h://localhost:${ builtins.toString cfg.proxies.tor.port }" ];
      using_tor_proxy = true;
    };
    tor.settings.SOCKSPort = lib.optionals cfg.enable [{
      addr = "127.0.0.1";
      port = cfg.proxies.tor.port;
      IsolateDestAddr = false;
    }];
  };
}
