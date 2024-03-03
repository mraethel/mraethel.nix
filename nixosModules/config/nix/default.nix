{
  config,
  ...
}: {
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    includes = [ config.sops.secrets.github_pat.path ];
  };
  sops.secrets.github_pat = { };
}
