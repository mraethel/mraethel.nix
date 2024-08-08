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
          cmp = true;
          treesitter = true;
          telescope.enabled = true;
          nvimtree = true;
          native_lsp.enabled = true;
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
          jdt-language-server.enable = true;
          kotlin-language-server.enable = true;
        };
      };

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "treesitter"; }
            {
              name = "buffer";
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
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
        settings.highlight.enable = true;
      };
    };
  };
}
