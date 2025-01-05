{
  config,
  pkgs,
  lib,
  ...
}: {
  options.hm = {
    home.file.".emacs.d".source = pkgs.fetchFromGitHub {
      owner = "doomemacs";
      repo = "doomemacs";
      rev = "99c6949e5464746a232cbe619b359d1fa05ed8fe";
      hash = "sha256-gPhsBTNaCXgfHylbmi3g4oqxUYZ1XEuGo6CD6RapUms=";
    };
    systemd.user.sessionVariables = {
      DOOMLOCALDIR = "$HOME/.local/share/doomemacs";
      DOOMPROFILELOADFILE = "$HOME/.local/share/doomemacs/profiles/load.el";
    };
  };
  options.hm = {
    emacs.enable = lib.mkEnableOption "enable emacs";
  };

  config = lib.mkIf config.hm.emacs.enable {
    programs.emacs = {
      enable = true;
      extraPackages = epkgs:
        with epkgs; [
          # Core
          use-package
          diminish
          which-key

          # Completion
          vertico
          marginalia
          consult
          orderless

          # Development
          magit
          projectile
          treemacs
          company
          flycheck
          lsp-mode
          lsp-ui

          # Theme and UI
          doom-themes
          doom-modeline
          all-the-icons

          # Language modes
          rust-mode
          typescript-mode
          python-mode
          nix-mode
          markdown-mode

          # Org mode extras
          org-bullets
          org-roam
        ];
    };
  };
}
