{
  config,
  ...
}: {
  services.searx = {
    enable = true;
    proxies.tor.enable = true;
    environmentFile = config.sops.secrets.searx.path;
    settings = {
      general.enable_metrics = false;
      search = {
        autocomplete = "google";
        default_lang = "en";
      };
      server.secret_key = "@SEARX_KEY@";
      ui = {
        default_locale = "en";
        infinite_scroll = true;
        center_alignment = true;
        theme_args.simple_style = "dark";
      };
    };
  };
}
