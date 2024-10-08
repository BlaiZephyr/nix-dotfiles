{pkgs, ... }:
{

  hm.programs.obs-studio = {
    enable = true;
  };

  hm.services.flameshot = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdenlive
  ];
}
