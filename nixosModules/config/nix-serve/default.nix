{
  config,
  hostName,
  ...
}: {
  services.nix-serve = {
    enable = true;
    secretKeyFile = config.sops.secrets.nix-serve.path;
  };
  sops.secrets.nix-serve = { sopsFile = ../../../secrets/systems/${ hostName }.yaml; };
}
