{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.iamb;
in {
  options.programs.iamb = {
    enable = lib.mkEnableOption "iamb";
    package = lib.mkPackageOption pkgs "iamb" { };
  };

  config.environment.systemPackages = lib.mkIf cfg.enable [ cfg.package ];
}
