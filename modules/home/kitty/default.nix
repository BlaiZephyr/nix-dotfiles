{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.hm = {
    kitty.enable = lib.mkEnableOption "enable kitty";
  };
  config = lib.mkIf config.hm.kitty.enable {
    home.packages = with pkgs; [
      btop
    ];
    programs.kitty = {
      enable = true;
      font = lib.mkForce {
        name = "JetBrainsMonoNL Nerd Font Mono";
        size = 16.0;
      };
      settings = lib.mkForce {
        background_opacity = "0.8";
        enable_audio_bell = false;
        shell = "bash";
        url_style = "single";
        cursor_shape = "block";
        scrollback_lines = 2000;
        confirm_os_window_close = 0;
        font_size = 11;

        # Ayu Dark Theme Colors
        background = "#0A0E14";
        foreground = "#B3B1AD";
        selection_background = "#273747";
        selection_foreground = "#B3B1AD";

        # Normal colors
        color0 = "#01060E"; # black
        color1 = "#EA6C73"; # red
        color2 = "#91B362"; # green
        color3 = "#F9AF4F"; # yellow
        color4 = "#53BDFA"; # blue
        color5 = "#FAE994"; # magenta
        color6 = "#90E1C6"; # cyan
        color7 = "#C7C7C7"; # white

        # Bright colors
        color8 = "#686868"; # bright black
        color9 = "#F07178"; # bright red
        color10 = "#C2D94C"; # bright green
        color11 = "#FFB454"; # bright yellow
        color12 = "#59C2FF"; # bright blue
        color13 = "#FFEE99"; # bright magenta
        color14 = "#95E6CB"; # bright cyan
        color15 = "#FFFFFF"; # bright white

        # Extended colors
        cursor = "#F29718";
        cursor_text_color = "#0A0E14";
        url_color = "#59C2FF";

        # Tab bar colors
        active_tab_foreground = "#0A0E14";
        active_tab_background = "#F29718";
        inactive_tab_foreground = "#B3B1AD";
        inactive_tab_background = "#0F1419";
        tab_bar_background = "#0A0E14";

        active_border_color = "#F29718";
        inactive_border_color = "#0F1419";
        bell_border_color = "#FF3333";
      };
    };
  };
}
