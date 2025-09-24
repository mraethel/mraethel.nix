{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.ploopy;
in
{
  imports = [ ./udev ];

  options.programs.ploopy.enable = lib.mkEnableOption "ploopy";

  config.environment.systemPackages = lib.mkIf cfg.enable [ pkgs.headphones-toolbox ];
}
