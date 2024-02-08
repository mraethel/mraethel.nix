final: prev: {
  ungoogled-chromium = prev.ungoogled-chromium.overrideAttrs (super: {
    patches = (super.patches or []) ++ [
      (prev.fetchpatch {
        url = "https://git.savannah.gnu.org/cgit/guix.git/plain/gnu/packages/patches/ungoogled-chromium-extension-search-path.patch";
        hash = "sha256-NQ25dWkVQPAJ1DFiXpb1kf4Ew0KjZeMcmwle29ZTvao=";
      })
    ];
  });
}
