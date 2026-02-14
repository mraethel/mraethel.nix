{
  config,
  mraethel,
  ...
}:
{
  home-manager.users.nixos = {
    imports =
      let
        config = mraethel.homeModules.config;
      in
      with mraethel.homeModules;
      [
        config.git
        users.nixos
      ];
    programs.git.settings.credential.helper = "store --file ${
      config.sops.secrets."nixos/github_pat".path
    }";
  };
  sops.secrets."nixos/github_pat" = {
    owner = config.users.users.nixos.name;
    sopsFile = ./secrets.yaml;
  };
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [
      "keys"
      "wheel"
    ];
  };
}
