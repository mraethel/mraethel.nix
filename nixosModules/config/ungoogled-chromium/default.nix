{
  programs.chromium = {
    enable = true;
    usePrivoxy = true;
    searx.enable = true;
    ManagedBookmarks = [{
      name = "NixOS";
      url = "https://search.nixos.org";
    }];
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
      HighEfficiencyModeEnabled = true;
      HttpsOnlyMode = "force_enabled";
      PasswordManagerEnabled = false;
      SavingBrowserHistoryDisabled = true;
      ShowHomeButton = true;
      SyncDisabled = true;
    };
  };
}
