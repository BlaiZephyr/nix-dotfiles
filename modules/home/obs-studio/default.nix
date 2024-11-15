{
  lib,
  config,
  ...
}: {
  options.hm = {
    obs-studio.enable = lib.mkEnableOption "enable obs-studio";
  };

  imports = [
    ./plugins
  ];

  config = lib.mkIf config.hm.obs-studio.enable {
    programs.obs-studio = {
      enable = true;
    };
  };
}
