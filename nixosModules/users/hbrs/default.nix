{
  mraethel,
  ...
}: {
  users.users.hbrs.isNormalUser = true;
  home-manager.users.hbrs.imports = [ mraethel.homeModules.users.hbrs ];
}
