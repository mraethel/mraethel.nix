{
  config,
  ...
}:
{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    includes = [ config.sops.secrets."nix/github_pat".path ];
  };
  sops.secrets."nix/github_pat".sopsFile = ./secrets.yaml;
}
