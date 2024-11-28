{
  lib,
  pkgs,
  config,
  ...
}: {
  options.development = {
    utils.enable = lib.mkEnableOption "Enable LSP and Formatters for development";
    #TODO: think about if this really should be installed systemwide, or better fit into homeModules.
  };
  config = lib.mkIf config.development.utils.enable {
    environment.systemPackages = with pkgs; [
      devenv
      #clang is really annoying, i just want my peace
      llvmPackages.libcxxClang
      llvmPackages.libcxxStdenv
      clang-tools
      clang
      libclang

      nixpkgs-review #seperate?
      gh
      git
      nixfmt-rfc-style #for nixpkgs

      nixd #LSP
      alejandra #code formatter
    ];
  };
}
