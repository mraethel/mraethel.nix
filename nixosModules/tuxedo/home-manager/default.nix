{
  mraethel,
  ...
}: {
  home-manager.users = {
    nixos.imports = [ mraethel.homeModules.tuxedo.nixos ];
  };
}
