{
  config,
  lib,
  mraethel,
  ...
}:
let
  cfg = config.programs.glirc;
in
{
  options.programs.glirc = {
    enable = lib.mkEnableOption "glirc";
    package = lib.mkPackageOption mraethel.legacyPackages.${config.nixpkgs.system} "glirc" { };
  };

  config.environment.systemPackages = lib.mkIf cfg.enable [ cfg.package ];
}
