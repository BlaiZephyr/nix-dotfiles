{ inputs, config, ... }: {
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      vimAlias = true;
      viAlias = true;

      lineNumberMode = "relNumber";
      options = {
        tabstop     = 4;
        shiftwidth  = 4;
        expandtab   = true;
        wrap        = false;
      };

      clipboard.enable = true;

      telescope.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
        trouble.enable = true;
        lspSignature.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;

        clang.enable = true;
        rust.enable = true;
        html.enable = true;

        ts = {
          enable = true;
          lsp.enable = true;
          format.type = "prettierd";
        };

        css = {
          enable = true;
          lsp.enable = true;
          format.type = "prettierd";
        };
      };

      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;
      autopairs.nvim-autopairs.enable = true;

      filetree.neo-tree.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      binds.whichKey.enable = true;

      statusline.lualine = {
        enable = true;
        theme = "base16";
      };

      dashboard.dashboard-nvim.enable = false;
      visuals = {
        nvim-web-devicons.enable = true;
        indent-blankline.enable = false;
        rainbow-delimiters.enable = false;
        fidget-nvim.enable = false;
      };
      ui = {
        noice.enable = false;
        smartcolumn.enable = false;
        colorizer.enable = false;
      };

      # 🎹 Your keymaps
      keymaps = [
        {
          key = "jk";
          mode = [ "i" ];
          action = "<ESC>";
          desc = "Exit insert mode";
        }
        {
          key = "<leader>nh";
          mode = [ "n" ];
          action = ":nohl<CR>";
          desc = "Clear search highlights";
        }
        {
          key = "<leader>ff";
          mode = [ "n" ];
          action = "<cmd>Telescope find_files<cr>";
          desc = "Search files by name";
        }
        {
          key = "<leader>lg";
          mode = [ "n" ];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Search files by contents";
        }
        {
          key = "<leader>fe";
          mode = [ "n" ];
          action = "<cmd>Neotree toggle<cr>";
          desc = "File browser toggle";
        }
        {
          key = "<C-h>";
          mode = [ "i" ];
          action = "<Left>";
          desc = "Move left in insert mode";
        }
        {
          key = "<C-j>";
          mode = [ "i" ];
          action = "<Down>";
          desc = "Move down in insert mode";
        }
        {
          key = "<C-k>";
          mode = [ "i" ];
          action = "<Up>";
          desc = "Move up in insert mode";
        }
        {
          key = "<C-l>";
          mode = [ "i" ];
          action = "<Right>";
          desc = "Move right in insert mode";
        }
      ];
    };
  };
}
