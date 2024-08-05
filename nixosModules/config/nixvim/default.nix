{
  mraethel,
  system,
  ...
}: {
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    opts = {
      expandtab = true;
      number = true;
      relativenumber = true;
      shiftwidth = 0;
      tabstop = 2;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        integrations = {
          lualine.enable = true;
        };
      };
    };

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      telescope.enable = true;
      lsp.servers.hls.enable = true;
      treesitter-context.enable = true;
      treesitter-refactor.enable = true;
      nix.enable = true;
      cmp-nvim-lsp.enable = true;
      neogit.enable = true;
      diffview.enable = true;
      gitmessenger.enable = true;
      
      cmp = {
        enable = true;
        settings.sources = [{ name = "nvim_lsp"; }];
      };
      
      vimtex = {
        enable = true;
        texlivePackage = mraethel.packages.${ system }.texlive;
        settings.view_method = "zathura";
      };

      nvim-tree = {
        enable = true;
        openOnSetup = true;
        actions.openFile.quitOnOpen = true;
        view.side = "right";
      };

      treesitter = {
        enable = true;
        folding = true;
      };
    };
  };
}
