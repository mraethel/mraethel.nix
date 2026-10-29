{
  config,
  ...
}: let
  cfg = config.services.vaultwarden;
in {
  services = {
    nginx.virtualHosts."vault.mraethel.de" = {
      enableACME = true;
      forceSSL = true;
      locations."/".proxyPass = "http://[${cfg.config.ROCKET_ADDRESS}]:${toString cfg.config.ROCKET_PORT}";
    };
    vaultwarden = {
      enable = true;
      environmentFile = config.sops.secrets.vault.path;
      config = {
        DOMAIN = "https://vault.mraethel.de";
        SIGNUPS_ALLOWED = false;
        SHOW_PASSWORD_HINT = false;
        INVITATIONS_ALLOWED = false;
        ROCKET_ADDRESS = "::1";
        ROCKET_PORT = 8222;
        SMTP_HOST = "::1";
        SMTP_PORT = 25;
        SMTP_SECURITY = "off";
        SMTP_FROM = "vault@mraethel.de";
      };
    };
  };
  sops.secrets.vault.sopsFile = ../secrets.yaml;
}
