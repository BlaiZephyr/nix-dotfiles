{
  lib,
  config,
  ...
}: {
  options.hm = {
    nh.enable = lib.mkEnableOption "enable the nix helper utility";
  };

  config = lib.mkIf config.hm.nh.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 12d --keep 3";
    };
  };
}
