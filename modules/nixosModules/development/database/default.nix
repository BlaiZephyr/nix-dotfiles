{
  lib,
  pkgs,
  config,
  ...
}: {
  options.development = {
    mysql.enable = lib.mkEnableOption "Enable mysql with the mariadb Package";
  };
  config = lib.mkIf config.development.mysql.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };
}
