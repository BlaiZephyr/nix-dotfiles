{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options.hm = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hm.hyprland.enable {
    home.packages = with pkgs; [
      loupe
      grim
      grimblast
      libnotify
      wl-clipboard
      wofi
      xwaylandvideobridge
    ];
    fonts.fontconfig.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;

      extraConfig = ''
        exec-once=${pkgs.waybar}/bin/waybar
        input {
        kb_layout=de
        kb_options=nodeadkeys
        monitor = "DP-2,highrr,auto,auto";
        monitor = "DP-3,highrr,auto,auto";

        }
      '';
      settings = {
        "$mod" = "SUPER";
        bind = [
          "$mod, W, exec, firefox"
          "$mod, space, exec, rofi -show drun"
          "$mod, Enter, exec, kitty"
        ];
      };
    };
  };
}
