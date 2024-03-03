{
  config,
  lib,
  ...
}: let
  cfg = config.programs.chromium;
in {
  options.programs.chromium.useSearx = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config.programs.chromium = lib.mkIf cfg.useSearx {
    defaultSearchProviderEnabled = true;
    defaultSearchProviderSearchURL = "http://localhost:${ builtins.toString config.services.searx.port }/search?q={searchTerms}";
    defaultSearchProviderSuggestURL = "http://localhost:${ builtins.toString config.services.searx.port }/autocompleter?q={searchTerms}";
    extraOpts = {
      DefaultSearchProviderName = "SearXNG";
      NewTabPageLocation = "http://localhost:${ builtins.toString config.services.searx.port }/search";
    };
  };
}
