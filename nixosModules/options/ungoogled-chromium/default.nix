{
  config,
  lib,
  mraethel,
  ...
}:
let
  cfg = config.programs.chromium;
  mbType = with lib.types; listOf (attrsOf (either str mbType));
  # Maybe one day this will work (https://discourse.nixos.org/t/problems-with-types-oneof-and-submodules/15197/5) (https://github.com/NixOS/nixpkgs/pull/254790)
  # mbType = with lib.types;
  #   listOf
  #     (oneOf [
  #       (submodule { options.toplevel-name = lib.mkOption { type = str; }; })
  #       (submodule {
  #         options = {
  #           name = lib.mkOption { type = str; };
  #           url = lib.mkOption { type = str; };
  #         };
  #       })
  #       (submodule {
  #         options = {
  #           name = lib.mkOption { type = str; };
  #           children = lib.mkOption { type = mbType; };
  #         };
  #       })
  #     ]);
in
{
  imports = [
    ./privoxy
    ./searx
  ];

  options.programs.chromium = {
    package = lib.mkPackageOption mraethel.packages.${config.nixpkgs.system} "ungoogled-chromium" { };
    ManagedBookmarks = lib.mkOption {
      type = mbType;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
    programs.chromium.extraOpts.ManagedBookmarks = cfg.ManagedBookmarks;
  };
}
