{
  config,
  lib,
  pkgs,
  ...
}: {
  #this requires niri - otherwise it breaks
  config = lib.mkIf config.desktop.niri.enable {
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "cosmec";
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.niri}/bin/niri-session";
          user = "cosmec";
        };
        default_session = initial_session;
      };
    };
  };
}
