final: prev: {
  ungoogled-chromium = prev.ungoogled-chromium.overrideAttrs (super: {
    patches = (super.patches or [ ]) ++ [
      (prev.fetchpatch {
        url = "https://git.savannah.gnu.org/cgit/guix.git/plain/gnu/packages/patches/ungoogled-chromium-extension-search-path.patch";
        hash = "sha256-YVe4lG2vixmcCQX7fGXkn3DMh9EFoV0GL/H/jEnfLCs=";
      })
    ];
  });
}
