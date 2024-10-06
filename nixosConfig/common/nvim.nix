{pkgs, ... }: {

  fonts.fontconfig.enable = true;
  hm.programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  hm.home.packages = with pkgs; [
    lunarvim
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
   ];
}
