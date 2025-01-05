{ lib, ... }:
{
  programs.nvf.settings.vim = {
    globals = {
      mapleader = " ";
    };
    viAlias = false;
    vimAlias = true;
    useSystemClipboard = true;
    spellcheck.enable = true;

    luaConfigPost = ''
      vim.luaConfigRC.ayu = "vim.cmd('colorscheme ayu')";
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.smartindent = true
      vim.opt.clipboard:append("unnamedplus")
      vim.opt.expandtab = true     -- Use spaces instead of tabs

      -- Custom Tree-sitter parser directory configuration
      local parser_install_dir = vim.fn.stdpath("data") .. "/parsers"
      vim.opt.runtimepath:append(parser_install_dir)
      require'nvim-treesitter.configs'.setup {
          parser_install_dir = parser_install_dir,
          ensure_installed = { "nix", "rust", "cpp", "go", "elixir", "sql", "html", "lua", "markdown" },
          highlight = { enable = true },
          indent = { enable = true },
          incremental_selection = { enable = true },
      }
    '';
    comments.comment-nvim.enable = true;
  };
}
