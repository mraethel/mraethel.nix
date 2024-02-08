{
  config,
  lib,
  mraethel,
  system,
  ...
}: let 
  cfg = config.programs.glirc;
in {
  options.programs.glirc = {
    enable = lib.mkEnableOption "glirc";
    package = lib.mkPackageOption mraethel.legacyPackages.${ system } "glirc" { };
  };

  config.environment.systemPackages = lib.mkIf cfg.enable [ cfg.package ];
}
