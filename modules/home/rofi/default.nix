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
      configPath = "./generated";
      extraConfig = {
        modi = "drun,emoji,ssh";
      };
    };
  };
}
