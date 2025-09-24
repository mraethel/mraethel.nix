{
  config,
  lib,
  ...
}:
let
  cfg = config.programs.zsh;
in
{
  imports = [ ./p10k ];

  options.programs.zsh.completion.specialDirs = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config.programs.zsh.promptInit = lib.mkIf cfg.completion.specialDirs "zstyle ':completion:*' special-dirs true";
}
