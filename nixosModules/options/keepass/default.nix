{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.keepass;
in {
  options.programs.keepass = {
    enable = lib.mkEnableOption "keepass";
    package = lib.mkPackageOption pkgs "keepassxc" { };
  };

  config.environment.systemPackages = lib.mkIf cfg.enable [ cfg.package ];
}
