{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.fossil;
in
{
  options.programs.fossil = {
    enable = lib.mkEnableOption "fossil";
    package = lib.mkPackageOption pkgs "fossil" { };
  };

  config.home.packages = lib.mkIf cfg.enable [ cfg.package ];
}
