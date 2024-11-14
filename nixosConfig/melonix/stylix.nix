{pkgs, ...}: {
  stylix = {
    enable = false;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    image = ./Background.png;

    targets = {
      gnome.enable = true;
      lightdm.enable = true;
      gtk.enable = true;
      nixos-icons.enable = true;
    };
    cursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
      size = 32;
    };
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
    };
  };
}
