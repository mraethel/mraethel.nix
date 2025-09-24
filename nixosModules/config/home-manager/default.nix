{
  config,
  mraethel,
  ...
}:
{
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit (config.system) stateVersion; };
    sharedModules = (
      with mraethel.homeModules.config;
      [
        home
        sd-switch
      ]
    );
  };
}
