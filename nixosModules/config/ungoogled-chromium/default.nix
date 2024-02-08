{
  programs = {
    chromium = {
      enable = true;
      usePrivoxy = true;
      defaultSearchProviderEnabled = true;
      defaultSearchProviderSearchURL = "http://localhost:8888/search?q={searchTerms}";
      defaultSearchProviderSuggestURL = "http://localhost:8888/autocompleter?q={searchTerms}";
      extraOpts = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        BlockThirdPartyCookies = true;
        BrowserThemeColor = "#1e1e2e";
        ClearBrowsingDataOnExitList = [
          "browsing_history"
          "download_history"
          "cookies_and_other_site_data"
          "cached_images_and_files"
          "password_signin"
          "autofill"
          "site_settings"
          "hosted_app_data"
        ];
        DefaultSearchProviderName = "SearXNG";
        HighEfficiencyModeEnabled = true;
        HttpsOnlyMode = "force_enabled";
        NewTabPageLocation = "http://localhost:8888/search";
        PasswordManagerEnabled = false;
        SavingBrowserHistoryDisabled = true;
        SyncDisabled = true;
      };
    };
  };
}
