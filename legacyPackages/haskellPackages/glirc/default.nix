{
  haskellPackages,
  haskell
}: haskellPackages.override {
  overrides = self: super: {
    glirc = super.callHackageDirect {
      pkg = "glirc";
      ver = "2.40.1";
      sha256 = "sha256-iVnzuiekKCMi/PLUiOMnmqJWn9T/KKbH3PJ1rkrTQbs=";
    } { };
    irc-core = super.callHackageDirect {
      pkg = "irc-core";
      ver = "2.12";
      sha256 = "sha256-emQt7X5cpvv+gidN5Ueqj392efICMOxIB9Wcoz9K4RU=";
    } { };
    vty = super.vty_6_1;
    vty-unix = haskell.lib.markUnbroken super.vty-unix;
  };
}
