{
  inputs,
  lib,
  config,
  ...
}: {
  options.hm = {
    plasma-manager.enable = lib.mkEnableOption "enables plasma-manager";
  };

  imports = [inputs.plasma-manager.homeManagerModules.plasma-manager];

  config = lib.mkIf config.hm.plasma-manager.enable {
    programs.plasma = {
      enable = true;
      workspace = {
        theme = "Breeze";
        colorScheme = "GruvboxColors";
        lookAndFeel = "org.kde.breezedark.desktop";
      };

      shortcuts = {
        ksmserver = {
          "Show Rofi" = [
            "rofi -show drun"
            "Meta+D"
          ];
        };
      };
      configFile = {
      };
    };
  };
}
