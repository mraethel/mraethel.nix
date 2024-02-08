{
  config,
  lib,
  mraethel,
  system,
  ...
}: let 
  cfg = config.programs.chromium;
in {
  options.programs.chromium = {
    package = lib.mkPackageOption mraethel.packages.${ system } "ungoogled-chromium" { };
    usePrivoxy = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
    programs.chromium.extraOpts.ProxySettings = lib.optionalAttrs cfg.usePrivoxy { # why is mkIf not working in here?
      ProxyMode = "fixed_servers";
      ProxyServer = "http://${ config.services.privoxy.settings.listen-address }";
    };
  };
}
