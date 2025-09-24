{
  mraethel,
  ...
}:
{
  home-manager.users.root.imports = (
    with mraethel.homeModules.config;
    [
      git
    ]
  );
}
