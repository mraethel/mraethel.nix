{
  mraethel,
  pkgs,
  ...
}:
{
  # programs.nixvim = {
  #   enable = true;
  #   defaultEditor = true;
  #   package = (mraethel.nixvimConfigurations system).extra;
  # };
  environment.systemPackages = [ (mraethel.nixvimConfigurations.extra pkgs.system) ];
}
