{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.sops;
in
{
  options.programs.sops = {
    enable = lib.mkEnableOption "sops";
    package = lib.mkPackageOption pkgs "sops" { };
  };

  config.environment.systemPackages = lib.mkIf cfg.enable [ cfg.package ];
}
