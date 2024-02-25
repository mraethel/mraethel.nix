{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.zsh;
in {
  options.programs.zsh.p10k = {
    enable = lib.mkEnableOption "powerlevel10k";
    configFile = lib.mkOption {
      type = lib.types.path;
      default = ./p10k.zsh;
    };
  };

  config = lib.mkIf (cfg.enable && cfg.p10k.enable) {
    fonts.packages = [ pkgs.meslo-lgs-nf ];
    programs = {
      alacritty.settings.font.normal.family = lib.mkIf config.programs.alacritty.enable "MesloLGS NF";
      zsh.promptInit = ''
        # powerlevel10k
        source ${ pkgs.zsh-powerlevel10k }/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        source ${ cfg.p10k.configFile }
      '';
    };
  };
}
