{
  inputs,
  pkgs-stable,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    inputs.home-manager.nixosModules.default
  ];

  programs.firefox.enable = true;
  services.xserver.enable = true;

  desktop = {
    plasma6.enable = true;
  };

  utility = {
    thunar.enable = true;
    steam.enable = false;
  };

  development = {
    utils.enable = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cosmec";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";
  console = lib.mkDefault {
    keyMap = "de";
    useXkbConfig = true;
  };

  services.xserver.xkb.layout = "de";
  services.printing.enable = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs pkgs-stable;
    };
    users."cosmec" = import ./home.nix;
    useUserPackages = true;
  };

  services.libinput.enable = true;

  services.emacs = {
    enable = true;
    };

  users.users.cosmec = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nix = {
    settings = {
      trusted-users = ["cosmec"];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  system.stateVersion = "24.11";
}
