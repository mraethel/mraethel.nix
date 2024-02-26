{
  mraethel,
  ...
}: {
  users.users.arcan.isNormalUser = true;
  home-manager.users.arcan.imports = (with mraethel.homeModules.options; [
    fossil
  ]) ++ (with mraethel.homeModules.config; [
    fossil
  ]);
}
