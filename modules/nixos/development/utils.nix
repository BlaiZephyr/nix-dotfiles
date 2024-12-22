{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.development = {
    utils.enable = lib.mkEnableOption "Enable LSP and Formatters for development";
  };
  config = lib.mkIf config.development.utils.enable {
    environment.systemPackages = with pkgs; [
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      rust-analyzer
      pyright

      nodePackages.prettier
      black
      rustfmt
      devenv
      #clang is really annoying, i just want my peace
      llvmPackages.libcxxClang
      llvmPackages.libcxxStdenv
      clang-tools
      clang
      libclang

      nixpkgs-review # seperate?
      gh
      git
      nixfmt-rfc-style # for nixpkgs

      nixd # LSP
      alejandra # code formatter
    ];
  };
}
