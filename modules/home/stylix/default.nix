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
        # Gruvbox dark colors
        base00 = "#282828"; # bg
        base01 = "#3c3836";
        base02 = "#504945";
        base03 = "#665c54";
        base04 = "#bdae93";
        base05 = "#d5c4a1"; # fg
        base06 = "#ebdbb2";
        base07 = "#fbf1c7";
        base08 = "#fb4934"; # red
        base09 = "#fe8019"; # orange
        base0A = "#fabd2f"; # yellow
        base0B = "#b8bb26"; # green
        base0C = "#8ec07c"; # aqua
        base0D = "#83a598"; # blue
        base0E = "#d3869b"; # purple
        base0F = "#d65d0e"; # brown
      };
      fonts = {
        serif = config.stylix.fonts.monospace;
        sansSerif = config.stylix.fonts.monospace;
        emoji = config.stylix.fonts.monospace;
      };
    };
  };
}