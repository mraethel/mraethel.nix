{
  mraethel,
  ...
}:
{
  home-manager.users.nixos.imports =
    (with mraethel.homeModules.config; [
      git
    ])
    ++ [ mraethel.homeModules.users.nixos ];
}
