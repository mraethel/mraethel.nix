{
  config,
  lib,
  ...
}: let
  cfg = config.services.matrix-conduit;
in {
  options.services.matrix-conduit.environmentFile = lib.mkOption {
    type = lib.types.nullOr lib.types.path;
    default = null;
  };

  config.systemd.services.conduit.serviceConfig.EnvironmentFile = lib.optional (!builtins.isNull cfg.environmentFile) cfg.environmentFile;
}
