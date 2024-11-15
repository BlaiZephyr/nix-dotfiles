{
  lib,
  config,
  ...
}: {
  options.hm = {
    git.enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf config.hm.git.enable {
    programs.git = {
      enable = true;
      userName = "BlaiZephyr";
      userEmail = "arbeit.t.lechner@gmail.com";
      ignores = [
        ".pre-commit-config.yaml"
        "result"
        "result-bin"
        "result-man"
        "target"
        ".devenv"
        ".direnv"
      ];
    };
  };
}
