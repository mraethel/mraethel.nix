{
  mraethel,
  ...
}: {
  home-manager.users = {
    nixos.imports = [ mraethel.homeModules.nixos ];
    hbrs.imports = [ mraethel.homeModules.hbrs ];
    sbmr.imports = [ mraethel.homeModules.sbmr ];
  };
}
