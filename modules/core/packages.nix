{pkgs, ...}: {
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

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    appimage-run
    brave
    brightnessctl
    cmatrix
    cowsay
    docker-compose
    duf
    eza
    ffmpeg
    file-roller
    gedit
    gimp
    greetd.tuigreet
    htop
    hyprpicker
    imv
    inxi
    killall
    libnotify
    libvirt
    lm_sensors
    lolcat
    lshw
    lxqt.lxqt-policykit
    meson
    mpv
    ncdu
    ninja
    nixfmt-rfc-style
    pavucontrol
    pciutils
    pkg-config
    playerctl
    ripgrep
    socat
    tree
    unrar
    unzip
    usbutils
    v4l-utils
    virt-viewer
    wget
  ];
}
