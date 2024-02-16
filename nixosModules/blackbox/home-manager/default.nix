{
  mraethel,
  ...
}: {
  home-manager.users = {
    nixos.imports = [ mraethel.homeModules.users.nixos ];
  };
}
