{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs.alacritty;
  toml = pkgs.formats.toml { };
in {
  options.programs.alacritty = {
    enable = lib.mkEnableOption "alacritty";
    package = lib.mkPackageOption pkgs "alacritty" { };
    settings = lib.mkOption {
      type = toml.type;
      default = { };
    };
  };
  
  config.environment = lib.mkIf cfg.enable {
    systemPackages = [ cfg.package ];
    etc.alacritty = {
      source = toml.generate "alacritty.toml" cfg.settings;
      target = "alacritty/alacritty.toml";
    };
  };
}
