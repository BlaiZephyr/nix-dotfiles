{
  inputs,
  lib,
  config,
  ...
}: {
  options.hm = {
    stylix.enable = lib.mkEnableOption "enables stylix";
  };

  imports = [inputs.stylix.homeManagerModules.stylix];

  config = lib.mkIf config.hm.stylix.enable {
    stylix = {
      enable = true;
      image = ./wallpapers/Background.png;
      base16Scheme = {
        # Tokyonight
        base00 = "#24283b";
        base01 = "#1f2335";
        base02 = "#292e42";
        base03 = "#565f89";
        base04 = "#a9b1d6";
        base05 = "#c0caf5";
        base06 = "#c0caf5";
        base07 = "#c0caf5";
        base08 = "#f7768e";
        base09 = "#ff9e64";
        base0A = "#e0af68";
        base0B = "#9ece6a";
        base0C = "#1abc9c";
        base0D = "#41a6b5";
        base0E = "#bb9af7";
        base0F = "#ff007c";
      };
      fonts = {
        serif = config.stylix.fonts.monospace;
        sansSerif = config.stylix.fonts.monospace;
        emoji = config.stylix.fonts.monospace;
        sizes = {
          desktop = 12;
          terminal = 12;
        };
      };
      targets = {
        firefox.enable = true; #idk, need to fix fontsize first
      };
    };
  };
}
