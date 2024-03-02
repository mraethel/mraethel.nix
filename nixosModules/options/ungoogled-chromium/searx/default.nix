{
  config,
  lib,
  ...
}: let
  cfg = config.programs.chromium;
# port = builtins.toString (config.services.searx.settings.server.port || 8888); # not possible since option doesnt exist
  port = builtins.toString 8888;
in {
  options.programs.chromium.useSearx = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config.programs.chromium = lib.mkIf cfg.useSearx {
    defaultSearchProviderEnabled = true;
    defaultSearchProviderSearchURL = "http://localhost:${ port }/search?q={searchTerms}";
    defaultSearchProviderSuggestURL = "http://localhost:${ port }/autocompleter?q={searchTerms}";
    extraOpts = {
      DefaultSearchProviderName = "SearXNG";
      NewTabPageLocation = "http://localhost:${ port }/search";
    };
  };
}
