{
  config,
  ...
}:
{
  networking.firewall.allowedTCPPorts = [ 5000 ];
  services.harmonia = {
    enable = true;
    signKeyPaths = [ config.sops.secrets.harmonia.path ];
  };
}
