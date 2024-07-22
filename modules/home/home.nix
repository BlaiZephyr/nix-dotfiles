{pkgs, ... }:
{

programs.home-manager.enable = true;

home.enableNixpkgsReleaseCheck = false;

  home.username = "melonix";
  home.homeDirectory = "/home/melonix";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
      git
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  dconf.settings = {
  "org/virt-manager/virt-manager/connections" = {
   autoconnect = ["qemu:///system"];
   uris = ["qemu:///system"];
};
};
}



