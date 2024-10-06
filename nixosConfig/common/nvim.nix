{ ... }: {

  fonts.fontconfig.enable = true;
  hm.programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
