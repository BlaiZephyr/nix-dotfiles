{pkgs, ...}: {
  programs.nvf.settings.vim = {
    languages = {
      clang = {
        enable = true;
        lsp.enable = true;
        lsp.server = "clangd";
        treesitter.enable = true;
      };

      rust = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      nix = {
        enable = true;
        lsp.enable = true;
        lsp.package = ["nixd"];
        extraDiagnostics.enable = false;
        format.enable = true;
        format.package = pkgs.alejandra;
        treesitter.enable = true;
      };

      go = {
        enable = true;
        lsp.enable = true;
        lsp.server = "gopls";
        dap.enable = true;
        dap.debugger = "delve";
        treesitter.enable = true;
        treesitter.package = pkgs.vimPlugins.nvim-treesitter.builtGrammars.go;
      };

      sql = {
        enable = true;
        extraDiagnostics.enable = true;
        format.enable = true;
        lsp.enable = true;
        lsp.server = "sqls";
        treesitter.enable = true;
      };

      html.enable = true;
      lua.enable = true;
      markdown.enable = true;
    };
  };
}
