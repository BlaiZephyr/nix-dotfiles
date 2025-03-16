{host, ...}: let
  inherit (import ../../hosts/${host}/variables.nix) waybarChoice;
in {
  imports = [
    ./bash.nix
    ./bashrc-personal.nix
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./emoji.nix
    ./fastfetch
    ./gh.nix
    ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./hyprland
    ./kitty.nix
    ./nvf.nix
    ./rofi
    ./qt.nix
    ./scripts
    ./starship.nix
    ./stylix.nix
    ./swaync.nix
    ./virtmanager.nix
    waybarChoice
    ./wezterm.nix
    ./wlogout
    ./xdg.nix
    ./yazi
    ./zoxide.nix
    ./zsh.nix
    ./zshrc-personal.nix
  ];
}
