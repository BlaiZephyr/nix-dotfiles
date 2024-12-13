{
  lib,
  pkgs,
  config,
  ...
}: {
  options.desktop = {
    niri.enable = lib.mkEnableOption "enable niri";
  };
  imports = [./greetd.nix];

  config = lib.mkIf config.desktop.niri.enable {
    environment.systemPackages = with pkgs; [
      niri
      xwayland-satellite
      wpaperd
      wl-clipboard
      xclip
    ];

    environment.variables = {
      NIXOS_OZONE_WL = "1";
      DISPLAY = ":0";
    };

    xdg.portal = {
      enable = lib.mkDefault true;
      xdgOpenUsePortal = true;
      extraPortals = [pkgs.xdg-desktop-portal-gnome];
      config = {
        common.default = "gnome";
      };
    };

    home-manager.users."cosmec" = {
      home.file.".config/niri/config.kdl" = {
        source = ./config.kdl;
      };
      home.shellAliases = {
        niv = "niri validate -c ~/.dotfiles/modules/nixosModules/desktop/niri/config.kdl ";
      };
    };
  };
}
