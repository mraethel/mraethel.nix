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
      telescope.enable = true;
      treesitter-context.enable = true;
      nix.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      luasnip.enable = true;
      cmp_luasnip.enable = true;
      neogit.enable = true;
      diffview.enable = true;
      gitmessenger.enable = true;
      
      lsp = {
        enable = true;
        servers = {
          hls.enable = true;
          nixd.enable = true;
        };
      };

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            {
              name = "buffer";
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
          ];
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };
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
