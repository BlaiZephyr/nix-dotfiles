{
  lib,
  pkgs,
  config,
  ...
}: {
  options.desktop = {
    plasma6.enable = lib.mkEnableOption "enable KDE-Plasma 6 Wayland";
  };
  config = lib.mkIf config.desktop.plasma6.enable {
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      oxygen
    ];
    # links /libexec from derivations to /run/current-system/sw
    environment.pathsToLink = ["/libexec"];

    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.displayManager.defaultSession = "plasma";
    services.displayManager.sddm.wayland.enable = true;
  };
}
