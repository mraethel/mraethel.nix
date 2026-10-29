{
  config,
  ...
}:
{
  mailserver = {
    enable = true;
    fqdn = "mail.mraethel.de";
    domains = [ "mraethel.de" ];
    accounts = {
      "mail@mraethel.de" = {
        hashedPasswordFile = config.sops.secrets."mailserver/mail@mraethel.de".path;
        aliases = [
          "abuse@mraethel.de"
          "postmaster@mraethel.de"
        ];
        quota = "2G";
      };
      "${config.services.vaultwarden.config.SMTP_FROM}" = {
        hashedPasswordFile = config.sops.secrets."mailserver/${config.services.vaultwarden.config.SMTP_FROM}".path;
        sendOnly = true;
        quota = "100M";
      };
    };
    x509.useACMEHost = config.mailserver.fqdn;
    stateVersion = 5;
  };
  services.nginx.virtualHosts."${config.mailserver.fqdn}" = {
    enableACME = true;
    forceSSL = true;
  };
  sops.secrets = {
    "mailserver/mail@mraethel.de".sopsFile = ../secrets.yaml;
    "mailserver/${config.services.vaultwarden.config.SMTP_FROM}".sopsFile = ../secrets.yaml;
  };
}
