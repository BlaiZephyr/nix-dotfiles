{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = false;
  };
  environment.systemPackages = with pkgs; [
    waybar
    hyprpaper
    wofi
  ];
}
