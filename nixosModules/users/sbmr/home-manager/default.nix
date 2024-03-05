{
  mraethel,
  ...
}: {
  home-manager.users.sbmr.imports = (with mraethel.homeModules.config; [
    git
  ]) ++ [ mraethel.homeModules.users.sbmr ];
}
