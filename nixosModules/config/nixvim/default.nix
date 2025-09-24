{
  config,
  mraethel,
  ...
}:
{
  # programs.nixvim = {
  #   enable = true;
  #   defaultEditor = true;
  #   package = (mraethel.nixvimConfigurations system).extra;
  # };
  environment.systemPackages = [ (mraethel.nixvimConfigurations config.nixpkgs.system).extra ];
}
