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
      # theme = {
      #   "*" = {
      #     bg0 = "rgba(28, 28, 28, 0.7)";
      #     bg1 = "rgba(40, 40, 40, 0.7)";
      #     fg0 = "#FFFFFF";
      #     fg1 = "#BBBBBB";
      #
      #     background-color = "transparent";
      #     text-color = "@fg0";
      #
      #     margin = 0;
      #     padding = 0;
      #     spacing = 0;
      #   };
      #
      #   "window" = {
      #     background-color = "@bg0";
      #     border-radius = "8px";
      #     width = "45%";
      #     height = "45%";
      #     border = "2px";
      #     border-color = "rgba(255, 255, 255, 0.1)";
      #   };
      #
      #   "inputbar" = {
      #     background-color = "@bg1";
      #     text-color = "@fg0";
      #     padding = "8px";
      #     border-radius = "8px";
      #     margin = "4px";
      #   };
      #
      #   "entry" = {
      #     text-color = "@fg0";
      #     padding = "0px 8px";
      #   };
      #
      #   "element" = {
      #     padding = "8px";
      #     spacing = "8px";
      #     margin = "4px";
      #     border-radius = "4px";
      #   };
      #
      #   "element normal active" = {
      #     text-color = "@fg1";
      #   };
      #
      #   "element selected" = {
      #     background-color = "rgba(255, 255, 255, 0.1)";
      #     text-color = "@fg0";
      #   };
      #
      #   "element-text" = {
      #     text-color = "inherit";
      #     vertical-align = "0.5";
      #   };
      #
      #   "element-icon" = {
      #     size = "1.5em";
      #   };
      # };
    };
  };
}
