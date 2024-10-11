{pkgs, ...}: {
  hm.programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        input-overlay
      ];
    };

    yt-dlp = {
      enable = true;

      settings = {
        embed-thumbnail = false;
        embed-subs = true;
        sub-langs = "ger";
        downloader = "aria2c";
        downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
      };
    };
  };

  hm.services.flameshot = {
    enable = true;
    package = pkgs.flameshot.overrideAttrs (oldAttrs: {
      cmakeFlags = oldAttrs.cmakeFlags ++ ["-DFLAMESHOT?DEBUG?CAPTURE=ON"];
    });
  };

  environment.systemPackages = with pkgs; [
    kdenlive
  ];
}
