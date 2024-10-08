{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      integrations = {
        cmp = true;
        lualine.enable = true;
        native_lsp.enabled = true;
        nvimtree = true;
        telescope.enabled = true;
        treesitter = true;
      };
    };
  };

  opts = {
    expandtab = true;
    number = true;
    relativenumber = true;
    shiftwidth = 0;
    tabstop = 2;
    signcolumn = "yes";
  }; 

  plugins = {
    diffview.enable = true;
    lualine.enable = true;
    luasnip.enable = true;
    nix.enable = true;
    treesitter-context.enable = true; 

    cmp = {
      enable = true;
      autoEnableSources = true;
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

    lsp = {
      enable = true;
      servers.nixd.enable = true;
      keymaps.lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
      };
    };

    nvim-tree = {
      enable = true;
      openOnSetup = true;
      actions.openFile.quitOnOpen = true;
      view.side = "right";
    };

    telescope = {
      enable = true;
      extensions = {
        file-browser.enable = true;
        frecency.enable = true;
        media-files.enable = true;
        ui-select.enable = true;
        undo.enable = true;
      };
      keymaps."<leader>fg" = "live_grep";
    };

    treesitter = {
      enable = true;
      folding = true;
      settings.highlight.enable = true;
    };
  }; 

  viAlias = true;
  vimAlias = true;
}
