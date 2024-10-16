mraethel: system: {
  plugins = {
    neogit.enable = true;
    gitmessenger.enable = true;
    rustaceanvim = {
      enable = true;
      settings = {
        cmd = [
          "rustup"
          "run"
          "nigtly"
          "rust-analyzer"
        ];
        default_settings = {
          rust-analyzer = {
            check.command = "clippy";
            inlayHints.lifetimeElisionHints.enable = "always";
          };
          standalone = false;
        };
      };
    };

    lsp = {
      servers = {
        hls.enable = true;
        kotlin-language-server.enable = true;
#         rust-analyzer = {
#           enable = true;
#           installCargo = true;
#           installRustc = true;
#         };
      };
    };
  };
}
