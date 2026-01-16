{
  config,
  ...
}:
{
  home-manager.users.nixos.programs.git.settings.credential.helper = "store --file ${
    config.sops.secrets."nixos/pat".path
  }";
}
