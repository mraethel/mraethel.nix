{
  stateVersion,
  mraethel,
  ...
}: {
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit stateVersion; };
    sharedModules = (with mraethel.homeModules.config; [
      home
      sd-switch
    ]);
  };
}
