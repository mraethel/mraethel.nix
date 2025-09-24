{
  config,
  ...
}:
{
  services.nix-serve = {
    enable = true;
    secretKeyFile = config.sops.secrets.nix-serve.path;
  };
}
