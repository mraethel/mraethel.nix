{
  config,
  lib,
  mraethel,
  system,
  ...
}: let
  cfg = config.programs.texlive;
in {
  options.programs.texlive = {
    enable = lib.mkEnableOption "texlive";
    package = lib.mkPackageOption mraethel.packages.${ system } "texlive" { };
  };

  config.environment.systemPackages = lib.mkIf cfg.enable [ cfg.package ];
}
