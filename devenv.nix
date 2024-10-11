{
  pkgs,
  inputs,
  ...
}: {
  env.GREET = "devenv";
  pre-commit.hooks = {
    shellcheck.enable = true;
    alejandra.enable = true;
  };
}
