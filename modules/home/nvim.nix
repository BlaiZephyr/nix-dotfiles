{config, lib, pkgs, ... }: {
    
  fonts.fontconfig.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
};
  home.packages = with pkgs; [
   lunarvim

   (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
   ];
}
