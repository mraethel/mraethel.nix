{
  mraethel,
  ...
}: {
  users.users.sbmr.isNormalUser = true;
  home-manager.users.sbmr.imports = [ mraethel.homeModules.users.sbmr ];
}
