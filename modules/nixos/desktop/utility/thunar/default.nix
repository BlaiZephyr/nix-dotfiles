{
  config,
  lib,
  pkgs,
  ...
}: {
  options.utility = {
    thunar.enable = lib.mkEnableOption "enable thunar";
  };

  config = lib.mkIf config.utility.thunar.enable {
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };
    environment.systemPackages = [pkgs.ffmpegthumbnailer];
  };
}
