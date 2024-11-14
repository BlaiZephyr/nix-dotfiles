{pkgs, ...}: {
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "melonix";
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "melonix";
      };
      default_session = initial_session;
    };
  };
}
