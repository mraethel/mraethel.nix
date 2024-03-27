{
  config,
  lib,
  mraethel,
  system,
  ...
}: let 
  cfg = config.programs.chromium;
  mbType = with lib.types; listOf (attrsOf (either str mbType));
# Maybe one day this will work (https://github.com/NixOS/nixpkgs/pull/284551)
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
in {
  imports = [
    ./privoxy
    ./searx
  ];

  options.programs.chromium = {
    package = lib.mkPackageOption mraethel.packages.${ system } "ungoogled-chromium" { };
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
