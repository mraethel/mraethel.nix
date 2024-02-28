{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.pipewire;
  json = pkgs.formats.json { };
in {
  options.services.pipewire.extraConfig.wireplumber = lib.mkOption {
    type = lib.types.attrsOf json.type;
    default = { };
  };

  config.services.pipewire.configPackages = lib.mapAttrsToList (file: conf: pkgs.writeTextDir "share/pipewire/wireplumber.conf.d/${ file }.conf" (builtins.readFile (json.generate "${ file }.conf" conf))) cfg.extraConfig.wireplumber;
}
