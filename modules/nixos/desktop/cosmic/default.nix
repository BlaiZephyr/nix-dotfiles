{
  config,
  pkgs,
  lib,
  utils,
  ...
}: {
  options = {
    desktop = {
      cosmic.enable = lib.mkEnableOption "COSMIC desktop environment";

      xwayland.enable = lib.mkEnableOption "Xwayland support for cosmic-comp" // {default = true;};
    };

    environment.cosmic.excludePackages = lib.mkOption {
      description = lib.mdDoc "List of COSMIC packages to exclude from the default environment";
      type = lib.types.listOf lib.types.package;
      default = [];
      example = lib.literalExpression "[ pkgs.cosmic-edit ]";
    };
  };

  config = lib.mkIf config.desktop.cosmic.enable {
    environment.pathsToLink = ["/share/cosmic"];
    environment.systemPackages = utils.removePackagesByName (with pkgs;
      (
        if lib.versionAtLeast lib.version "24.11"
        then [
          adwaita-icon-theme
        ]
        else [
          gnome.adwaita-icon-theme
        ]
      )
      ++ [
        alsa-utils
        cosmic-applets
        cosmic-applibrary
        cosmic-bg
        (cosmic-comp.override {
          useXWayland = config.desktop.xwayland.enable;
        })
        cosmic-edit
        cosmic-files
        cosmic-greeter
        cosmic-icons
        cosmic-launcher
        cosmic-notifications
        cosmic-osd
        cosmic-panel
        cosmic-randr
        cosmic-screenshot
        cosmic-session
        cosmic-settings
        cosmic-settings-daemon
        cosmic-term
        cosmic-workspaces-epoch
        hicolor-icon-theme
        playerctl
        pop-icon-theme
        pop-launcher
      ]
      ++ lib.optionals config.services.flatpak.enable [
        cosmic-store
      ])
    config.environment.cosmic.excludePackages;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs;
        [
          xdg-desktop-portal-cosmic
        ]
        ++ lib.optional (!(
          config.services.xserver.desktopManager.gnome.enable
          || config.services.xserver.desktopManager.deepin.enable
          || config.services.xserver.desktopManager.cinnamon.enable
          || config.services.xserver.desktopManager.phosh.enable
        ))
        pkgs.xdg-desktop-portal-gtk;
      configPackages = lib.mkDefault (with pkgs; [
        xdg-desktop-portal-cosmic
      ]);
    };

    # fonts
    fonts.packages =
      utils.removePackagesByName (with pkgs; [
        fira
      ])
      config.environment.cosmic.excludePackages;

    hardware.${
      if lib.versionAtLeast lib.version "24.11"
      then "graphics"
      else "opengl"
    }.enable =
      true;
    services.libinput.enable = true;
    xdg.mime.enable = true;
    xdg.icons.enable = true;

    services.acpid.enable = lib.mkDefault true;

    services.gvfs.enable = lib.mkDefault true;
    services.gnome.gnome-keyring.enable = lib.mkDefault true;

    # general graphical session features
    programs.dconf.enable = lib.mkDefault true;

    # required dbus services
    services.accounts-daemon.enable = true;
    services.upower.enable = true;
    services.power-profiles-daemon.enable = lib.mkDefault (!config.hardware.system76.power-daemon.enable);
    security.polkit.enable = true;
    security.rtkit.enable = true;

    # session packages
    services.displayManager.sessionPackages = with pkgs; [cosmic-session];
    systemd.packages = with pkgs; [cosmic-session];
    # TODO: remove when upstream has XDG autostart support
    systemd.user.targets.cosmic-session = {
      wants = ["xdg-desktop-autostart.target"];
      before = ["xdg-desktop-autostart.target"];
    };

    # required for screen locker
    security.pam.services.cosmic-greeter = {};
  };
}
