{
  mraethel,
  ...
}: {
  users.users.hbrs.isNormalUser = true;
  home-manager.users.hbrs.imports = (with mraethel.homeModules.config; [
    git
  ]) ++ [ mraethel.homeModules.users.hbrs ];
}
