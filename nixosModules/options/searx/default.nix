{
  config,
  lib,
  ...
}: let
  cfg = config.services.searx;
in {
  imports = [ ./tor ];

  options.services.searx.port = lib.mkOption {
    type = lib.types.port;
    default = 8888;
  };

  config.services.searx.settings.server.port = cfg.port;
}
