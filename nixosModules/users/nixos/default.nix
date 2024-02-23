{
  mraethel,
  ...
}: {
  users.users.nixos.isNormalUser = true;
  home-manager.users.nixos.imports = [ mraethel.homeModules.users.nixos ];
}
