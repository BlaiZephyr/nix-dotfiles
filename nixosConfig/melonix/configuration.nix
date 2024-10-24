# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./database.nix
    ./core-utils.nix
    ./networking.nix
  ];

  # GENERAL
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  #BOOT OPTIONS

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.kernelModules = ["amdgpu"];
  };

  #GRAPHICS
  hardware.graphics = {
    extraPackages = with pkgs; [amdvlk];
    extraPackages32 = with pkgs; [driversi686Linux.amdvlk];
    enable = true;
    enable32Bit = true;
  };

  #ENVIRONMENT
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
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "melonix";

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

  system.stateVersion = "24.05"; # Did you read the comment? yes :3

  nix = {
    settings = {
      trusted-users = ["melonix"];
      experimental-features = ["nix-command" "flakes"];
    };
    extraOptions = ''
      extra-substituters = ["https://devenv.cachix.org"];
      extra-trusted-public-keys = ["devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="];
    '';
  };
}
