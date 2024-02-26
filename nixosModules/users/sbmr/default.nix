{
  mraethel,
  ...
}: {
  users.users.sbmr.isNormalUser = true;
  home-manager.users.sbmr.imports = (with mraethel.homeModules.config; [
    git
  ]) ++ [ mraethel.homeModules.users.sbmr ];
}
