{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options.hm = {
    rofi.enable = lib.mkEnableOption "enables rofi-wayland";
  };

  config = lib.mkIf config.hm.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      terminal = "${pkgs.kitty}/bin/kitty";
      extraConfig = {
        modi = "drun,run,window";
        show-icons = true;
        drun-display-format = "{name}";
        disable-history = false;
        sidebar-mode = true;
      };
    };
  };
}
