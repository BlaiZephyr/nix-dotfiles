{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    vesktop
  ];
}
