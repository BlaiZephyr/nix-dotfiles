# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./database.nix
    ./hyprland.nix
    ./core-utils.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = ["amdgpu"];

  programs.nix-ld.enable = true;
  # for the zed editor so LSP servers work.
  programs.nix-ld.libraries = [];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  nix.extraOptions = ''
    extra-substituters = ["https://devenv.cachix.org"];
    extra-trusted-public-keys = ["devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="];
  '';

  nix.settings.trusted-users = ["melonix"];

  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
  ];
  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

  networking.hostName = "melonix";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [80 443];
    allowedUDPPortRanges = [
      {
        from = 8303;
        to = 8304;
      }
      {
        from = 8403;
        to = 8404;
      }
    ];
  };

  environment.pathsToLink = ["/libexec"]; # links /libexec from derivations to /run/current-system/sw
  services = {
    displayManager.defaultSession = "cinnamon";
    libinput.enable = true;
  };
  services.xserver = {
    enable = true;

    displayManager.lightdm.enable = true;
    desktopManager = {
      cinnamon.enable = true;
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    })
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 12d --keep 3";
    flake = "/home/melonix/.dotfiles/";
  };

  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.thunar-volman
    nix-output-monitor
    nvd
    clinfo
    devenv
    alejandra
    #games
    prismlauncher
    vesktop

    #kdenlive
    kdenlive
  ];

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.melonix = {
    isNormalUser = true;
    description = "melonix";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "melonix";

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  programs.firefox.enable = true;
  system.stateVersion = "24.05"; # Did you read the comment? yes :3
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";
}
