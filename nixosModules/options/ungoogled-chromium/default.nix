{
  config,
  lib,
  mraethel,
  system,
  ...
}: let 
  cfg = config.programs.chromium;
in {
  imports = [
    ./privoxy
    ./searx
  ];

  options.programs.chromium.package = lib.mkPackageOption mraethel.packages.${ system } "ungoogled-chromium" { };

  config.environment.systemPackages = lib.mkIf cfg.enable [ cfg.package ];
}
