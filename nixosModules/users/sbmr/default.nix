{
  config,
  mraethel,
  ...
}: {
  users.users.sbmr = {
    isNormalUser = true;
    extraGroups = [ "keys" ];
  };
  home-manager.users.sbmr.imports = (with mraethel.homeModules.config; [
    git
  ]) ++ [ mraethel.homeModules.users.sbmr ];
  sops.secrets."sbmr/pem" = {
    sopsFile = ../../../secrets/users/sbmr.yaml;
    owner = config.users.users.sbmr.name;
  };
}
