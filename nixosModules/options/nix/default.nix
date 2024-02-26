{
  config,
  lib,
  ...
}: let
  cfg = config.nix;
in {
  options.nix.accessTokens = lib.mkOption {
    type = lib.types.attrsOf lib.types.path;
    default = { };
  };

  config.nix.settings.access-tokens = builtins.toString (lib.mapAttrsToList (name: source: name + "=" + source.content) cfg.accessTokens); # token still lands inside the nix-store :/
}
