{
  config,
  lib,
  mraethel,
  ...
}:
let
  cfg = config.programs.ploopy;
in
{
  options.programs.ploopy.udev = {
    enable = lib.mkEnableOption "ploopy-udev";
    package = lib.mkPackageOption mraethel.packages.${config.nixpkgs.system} "ploopy-udev" { };
  };

  config.services.udev.packages = lib.mkIf (cfg.enable || cfg.udev.enable) [ cfg.udev.package ];
}
