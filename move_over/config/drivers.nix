{ pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [
    xboxdrv
    wineWowPackages.waylandFull
  ];

  boot.kernel.sysctl."vm.max_map_count" = lib.mkForce 16777216;
}
