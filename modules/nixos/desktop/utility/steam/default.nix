{
  lib,
  config,
  ...
}: {
  options.utility = {
    steam.enable = lib.mkEnableOption "enable steam";
  };

  config = lib.mkIf config.utility.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
