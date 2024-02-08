{
  config,
  lib,
  mraethel,
  system,
  ...
}: let
  cfg = config.programs.neovim;
in {
  disabledModules = [ "programs/neovim.nix" ];

  options.programs.neovim = {
    enable = lib.mkEnableOption "neovim";
    package = lib.mkPackageOption mraethel.packages.${ system } "neovim" { };
    defaultEditor = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config.environment = {
    systemPackages = lib.mkIf cfg.enable [ cfg.package ];
    variables.EDITOR = lib.mkIf cfg.defaultEditor (lib.mkOverride 900 "nvim");
  };
}
