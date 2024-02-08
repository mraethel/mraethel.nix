{
  config,
  ...
}: {
  hardware.nitrokey.enable = true;
  security.pam.u2f = {
    enable = true;
    authFile = config.sops.secrets.nitrokey.path;
  };
}
