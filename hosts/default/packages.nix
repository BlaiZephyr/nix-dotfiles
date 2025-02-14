{
  pkgs,
  ...
}:

{
  programs = {

    firefox.enable = false;
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    virt-manager.enable = true;
    mtr.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;
  hardware.keyboard.qmk.enable = true;

  environment.systemPackages = with pkgs; [
    appimage-run
    bat
    brave
    brightnessctl
    cmatrix
    cowsay
    discord
    docker-compose
    duf
    eza
    ffmpeg
    file-roller
    gedit
    gimp
    git
    greetd.tuigreet
    grim
    htop
    hyprpicker
    imv
    inxi
    killall
    libnotify
    libvirt
    libvirt
    lm_sensors
    lolcat
    lshw
    lxqt.lxqt-policykit
    meson
    mpv
    ncdu
    networkmanagerapplet
    nh
    ninja
    nixfmt-rfc-style
    pavucontrol
    pciutils
    pkg-config
    playerctl
    ripgrep
    slurp
    socat
    spotify
    swappy
    swaynotificationcenter
    swww
    tree
    unrar
    unzip
    usbutils
    v4l-utils
    vim
    virt-viewer
    wget
    wl-clipboard
    yad
    ydotool
  ];

}
