{
  config,
  pkgs,
  lib,
  ...
}: {
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

    # Create the Emacs configuration file
    home.file.".emacs.d/init.el".text = ''
      ;; Initialize package sources
      (require 'package)

      ;; Initialize use-package
      (require 'use-package)
      (setq use-package-always-ensure t)

      ;; Basic UI configuration
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (global-display-line-numbers-mode 1)

      ;; Theme
      (use-package doom-themes
        :config
        (load-theme 'doom-one t))

      ;; Modeline
      (use-package doom-modeline
        :init (doom-modeline-mode 1))

      ;; Completion framework
      (use-package vertico
        :init
        (vertico-mode))

      (use-package marginalia
        :init
        (marginalia-mode))

      ;; Development configuration
      (use-package lsp-mode
        :commands lsp
        :hook
        ((python-mode . lsp)
         (rust-mode . lsp)
         (typescript-mode . lsp))
        :config
        (setq lsp-prefer-flymake nil))

      ;; Project management
      (use-package projectile
        :config
        (projectile-mode +1)
        (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

      ;; Version control
      (use-package magit
        :bind ("C-x g" . magit-status))
    '';
  };
}
