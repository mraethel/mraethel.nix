{
  config,
  ...
}:
{
  networking.firewall.allowedTCPPorts = [ 5000 ];
  services.harmonia.cache = {
    enable = true;
    signKeyPaths = [ config.sops.secrets.harmonia.path ];
  };
}
