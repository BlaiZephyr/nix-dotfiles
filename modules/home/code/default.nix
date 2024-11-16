{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options.hm = {
    code.enable = lib.mkEnableOption "enables vs-code";
  };

  config = lib.mkIf config.hm.code.enable {
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "vscode"
      ];
    programs.vscode = {
      enable = true;
      extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
        ziglang.vscode-zig
        yzhang.markdown-all-in-one
        golang.go
        ms-python.python
        ms-python.debugpy
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        mkhl.direnv
        twxs.cmake
        ms-vscode.cmake-tools
        ms-vscode.cpptools-extension-pack
        kamadorueda.alejandra
      ];

      userSettings = {
        #NIXD
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "nixpkgs" = {
          "expr" = "import <nixpkgs> { }";
        };
        "formatting" = {
          "command" = ["alejandra"];
        };
      };
    };
  };
}
