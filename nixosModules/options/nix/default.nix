{
  config,
  lib,
  ...
}:
let
  cfg = config.nix;
in
{
  options.nix.includes = lib.mkOption {
    type = lib.types.listOf lib.types.path;
    default = [ ];
  };

  config.nix.extraOptions = lib.concatMapStringsSep "\n" (file: "!include ${file}") cfg.includes;
}
