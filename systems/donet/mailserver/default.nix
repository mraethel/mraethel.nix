{
  config,
  ...
}:
{
  enable = true;
  fqdn = "mail.mraethel.de";
  domains = [ "mraethel.de" ];
  loginAccounts = {
    "mail@mraethel.de" = {
      hashedPasswordFile = config.sops.secrets."mailserver/mail@mraethel.de".path;
      aliases = [
        "abuse@mraethel.de"
        "postmaster@mraethel.de"
      ];
      quota = "2G";
    };
    "vault@mraethel.de" = {
      hashedPasswordFile = config.sops.secrets."mailserver/vault@mraethel.de".path;
      sendOnly = true;
      quota = "100M";
    };
  };
  certificateScheme = "acme-nginx";
}
