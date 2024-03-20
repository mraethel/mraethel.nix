{
  config,
  ...
}: {
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    includes = [ config.sops.secrets."nix/pat".path ];
  };
}
