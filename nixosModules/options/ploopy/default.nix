{
  config,
  lib,
  mraethel,
  pkgs,
  system,
  ...
}: let
  cfg = config.programs.ploopy;
in {
  options.programs.ploopy = {
    enable = lib.mkEnableOption "ploopy";
    udev = {
      enable = lib.mkEnableOption "ploopy-udev";
      package = lib.mkPackageOption mraethel.packages.${ system } "ploopy-udev" { };
    };
  };
  
  config = {
    environment.systemPackages = lib.mkIf cfg.enable [ pkgs.headphones-toolbox ];
    services.udev.packages = lib.mkIf (cfg.enable || cfg.udev.enable) [ cfg.udev.package ];
  };
}
