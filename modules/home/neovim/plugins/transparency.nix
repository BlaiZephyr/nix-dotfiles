{pkgs, ...}: {
  programs.nvf.settings.vim = {
    config.vim.extraPlugins = with pkgs.vimPlugins; {
      transparent.nvim = {
        package = transparent-nvim;

        setup = ''
          require('transparent').setup({})
        '';
      };
    };
  };
}
