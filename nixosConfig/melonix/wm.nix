{pkgs, ...}: {
  environment.pathsToLink = ["/libexec"]; # links /libexec from derivations to /run/current-system/sw

  #test to disable x11 completly
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm.wayland.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];
}
