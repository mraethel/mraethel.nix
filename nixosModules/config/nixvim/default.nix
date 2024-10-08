{ mraethel
, system
, ...
}: {
# programs.nixvim = {
#   enable = true;
#   defaultEditor = true;
#   package = (mraethel.nixvimConfigurations system).extra;
# };
  environment.systemPackages = [ (mraethel.nixvimConfigurations system).extra ];
}
