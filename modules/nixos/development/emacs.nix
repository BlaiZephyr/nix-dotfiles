{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.development = {
    emacs.enable = lib.mkEnableOption "Enable emacs";
  };
  config = lib.mkIf config.development.emacs.enable {

    services.emacs = {
      enable = true;
      package = pkgs.emacs;
    };

    environment.systemPackages = with pkgs; [
      emacs
      imagemagick
    ];

    fonts.packages = with pkgs; [
      fira-code
      fira-code-symbols
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
        ];
      })
    ];

    nixpkgs.overlays = [
      (self: super: {
        emacsPackages = super.emacsPackages.overrideScope' (
          self: super: {
            #keep if needed for now
          }
        );
      })
    ];
  };
}
