{pkgs, lib, ...}: {

  environment.systemPackages = with pkgs; [
    xboxdrv
    wineWowPackages.waylandFull
    piper
    libratbag
  ];

  boot.kernel.sysctl."vm.max_map_count" = lib.mkForce 16777216;

  services.ratbagd.enable = true;

}
