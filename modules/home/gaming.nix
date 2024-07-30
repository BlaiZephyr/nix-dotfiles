{ pkgs, ... }: {

  home.packages = with pkgs; [
    ddnet
    lutris
    osu-lazer
    prismlauncher
    protonup-qt
    gamemode
    vulkan-tools
  ];
}
