{
  config,
  ...
}:
{
  home-manager.users.nixos.programs.git.extraConfig.credential.helper = "store --file ${
    config.sops.secrets."nixos/pat".path
  }";
}
