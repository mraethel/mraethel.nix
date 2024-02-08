{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs.alacritty;
  settingsFormat = pkgs.formats.toml { };
in {
  options.programs.alacritty = {
    enable = lib.mkEnableOption "alacritty";
    package = lib.mkPackageOption pkgs "alacritty" { };
    settings = lib.mkOption {
      type = settingsFormat.type;
      default = { };
    };
  };
  
  config.environment = lib.mkIf cfg.enable {
    systemPackages = [ cfg.package ];
    etc.alacritty = {
      source = settingsFormat.generate "alacritty.toml" cfg.settings;
      target = "alacritty/alacritty.toml";
    };
  };
}
