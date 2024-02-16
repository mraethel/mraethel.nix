{
  mraethel,
  ...
}: {
  home-manager.users = {
    nixos.imports = [ mraethel.homeModules.config.users.nixos ];
  };
}
