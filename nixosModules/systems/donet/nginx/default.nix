{
  security.acme = {
    acceptTerms = true;
    defaults.email = "mraethel@outlook.com";
  };
  services.nginx.virtualHosts = {
    "mraethel.de" = {
      enableACME = true;
      forceSSL = true;
    };
    "files.mraethel.de" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        extraConfig = "autoindex on;";
        root = "/srv";
      };
    };
  };
}
