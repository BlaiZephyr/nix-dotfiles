{
  pkgs,
  inputs,
  ...
}: {
  packages = with pkgs; [
  ];

  env.GREET = "devenv";
  pre-commit.hooks = {
    shellcheck.enable = true;
    alejandra.enable = true;
  };
}
