# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  inputs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules
    inputs.home-manager.nixosModules.default
  ];

  # GENERAL

  #iirc this is for nixd to properly function
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  programs.firefox.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    })
  ];

  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    thunderbird
    wineWowPackages.stable
    nix-output-monitor
    nvd
    clinfo
    devenv
    prismlauncher
    kdenlive

    piper
    lact
  ];

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  services.xserver = {enable = true;};

  desktop = {
    plasma6.enable = true;
    niri.enable = false;
  };

  utility = {
    thunar.enable = true;
    steam.enable = true;
  };

  development = {
    utils.enable = true;
  };

  boot = {
    plymouth.enable = true;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd.kernelModules = ["amdgpu"];
    kernelParams = ["quiet"];
    kernelPackages = pkgs.linuxPackages_latest;
  };

  #GRAPHICS
  hardware.graphics = {
    extraPackages = with pkgs; [
      amdvlk
      rocmPackages.clr.icd
    ];
    extraPackages32 = with pkgs; [driversi686Linux.amdvlk];
    enable = true;
    enable32Bit = true;
  };

  #NETWORKING
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

  #MOUSE
  services.ratbagd.enable = true;

  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  #AUDIO
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  #USER
  users.users.melonix = {
    isNormalUser = true;
    description = "melonix";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  #HOME-MANAGER
  home-manager = {
    extraSpecialArgs = {
      inherit inputs pkgs-stable;
    };
    users."melonix" = import ./home.nix;
    useUserPackages = true;
  };

  #NIX-SETTINGS
  nix = {
    settings = {
      trusted-users = ["melonix"];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    extraOptions = ''
      extra-substituters = ["https://devenv.cachix.org"];
      extra-trusted-public-keys = ["devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="];
    '';
  };
  system.stateVersion = "24.11";
}
