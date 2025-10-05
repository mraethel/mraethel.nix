{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.alacritty;
  toml = pkgs.formats.toml { };
in
{
  options.programs.alacritty = {
    enable = lib.mkEnableOption "alacritty";
    package = lib.mkPackageOption pkgs "alacritty" { };
    settings = lib.mkOption {
      type = toml.type;
      default = { };
    };
  };

  config.environment = lib.mkIf cfg.enable {
    etc.alacritty = {
      source = toml.generate "alacritty.toml" cfg.settings;
      target = "alacritty/alacritty.toml";
    };
    programs.alacritty.settings.font.normal.family =
      lib.mkIf config.programs.zsh.p10k.enable "MesloLGS NF";
    systemPackages = [ cfg.package ];
  };
}
