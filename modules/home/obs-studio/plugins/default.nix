{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.obs-studio.enable {
    programs.obs-studio = {
      plugins = with pkgs.obs-studio-plugins; [
        obs-gradient-source
        obs-pipewire-audio-capture
        obs-shaderfilter
        obs-composite-blur
      ];
    };
  };
}
