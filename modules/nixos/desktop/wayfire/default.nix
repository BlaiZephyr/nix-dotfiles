{
  pkgs,
  lib,
  config,
  ...
}: {
  options.desktop = {
    wayfire.enable = lib.mkEnableOption "enables wayfire";
  };

  config = lib.mkIf config.desktop.wayfire.enable {
    programs.wayfire = {
      enable = true;
      plugins = with pkgs.wayfirePlugins; [
        wcm
        wf-shell
        wayfire-plugins-extra
      ];
    };
  };
}
