{
  haskellPackages,
  haskell
}: haskellPackages.override {
  overrides = self: super: {
    vty_5_35_1 = super.vty;
    irc-core = haskell.lib.markUnbroken super.irc-core;
  };
}
