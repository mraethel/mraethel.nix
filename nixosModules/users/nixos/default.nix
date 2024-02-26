{
  mraethel,
  ...
}: {
  users.users.nixos.isNormalUser = true;
  home-manager.users.nixos.imports = (with mraethel.homeModules.config; [
    git
  ]) ++ [ mraethel.homeModules.users.nixos ];
}
