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
    ../../modules/nixosModules
    ./core-utils.nix
    ./networking.nix
    inputs.home-manager.nixosModules.default
  ];

  # GENERAL

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  services.xserver = {enable = true;};

  desktop = {
    plasma6.enable = true;
  };

  utility = {
    thunar.enable = true;
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

  #mouse
  services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [
    piper
    lact
  ];
  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  #ENVIRONMENT
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

  users.users.melonix = {
    isNormalUser = true;
    description = "melonix";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs pkgs-stable;
    };
    users."melonix" = import ../home;
    useUserPackages = true;
  };

  system.stateVersion = "24.05"; # Did you read the comment? yes :3

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
}
