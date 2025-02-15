 {
  pkgs,
  lib,
  config,
  ...
}: {
  options.hm = {
    emacs.enable = lib.mkEnableOption "enables emacs";
  };
  config = lib.mkIf config.hm.emacs.enable {
    home.packages = with pkgs; [
      # Language servers
      rust-analyzer
      gopls
      pyright # Python LSP
      ripgrep # For better searching
      fd # Better find
   ];

    programs.emacs = {
      enable = true;
      package = pkgs.emacs29;
      extraPackages = epkgs: [
        # Theme and UI
        epkgs.ayu-theme
        epkgs.doom-modeline
        epkgs.all-the-icons
        epkgs.dashboard
        
        # File tree and project management
        epkgs.treemacs
        epkgs.treemacs-projectile
        epkgs.treemacs-magit
        epkgs.projectile
        
        # LSP support
        epkgs.lsp-mode
        epkgs.lsp-ui
        epkgs.company
        epkgs.company-box
        epkgs.which-key
        epkgs.flycheck
        epkgs.yasnippet
        epkgs.yasnippet-snippets
        
        # Treesitter
        epkgs.tree-sitter
        epkgs.tree-sitter-langs
        
        # Git integration
        epkgs.magit
        epkgs.forge
        epkgs.git-gutter
        
        # Completion framework
        epkgs.ivy
        epkgs.counsel
        epkgs.swiper
        epkgs.ivy-rich
        
        # Language specific
        epkgs.rustic          # Rust
        epkgs.python-mode     # Python
        epkgs.pip-requirements
        epkgs.cmake-mode      # CMake
        epkgs.go-mode         # Go
        epkgs.company-go
        
        # Additional useful packages
        epkgs.rainbow-delimiters
        epkgs.smartparens
        epkgs.format-all
        epkgs.direnv          # For Nix development
      ];
    };

    home.file.".emacs" = {
      text = ''
        ;; Initialize package system
        (require 'package)
        (package-initialize)

        ;; Basic UI improvements
        (tool-bar-mode -1)
        (menu-bar-mode -1)
        (scroll-bar-mode -1)
        (global-display-line-numbers-mode)
        (setq inhibit-startup-screen t)

        ;; Set up doom-modeline
        (require 'doom-modeline)
        (doom-modeline-mode 1)

        ;; Dashboard setup
        (require 'dashboard)
        (dashboard-setup-startup-hook)
        (setq dashboard-startup-banner 'logo
              dashboard-items '((recents . 5)
                              (projects . 5)))

        ;; Theme setup
        (require 'ayu-theme)
        (load-theme 'ayu-dark t)

        ;; Global modes
        (which-key-mode)
        (global-company-mode)
        (yas-global-mode 1)
        (global-git-gutter-mode +1)
        (smartparens-global-mode)

        ;; Treemacs setup
        (require 'treemacs)
        (require 'treemacs-projectile)
        (global-set-key (kbd "C-c t") 'treemacs)

        ;; LSP configuration
        (require 'lsp-mode)
        (setq lsp-idle-delay 0.1
              lsp-enable-symbol-highlighting t
              lsp-enable-snippet t
              lsp-enable-completion-at-point t
              lsp-enable-indentation t
              lsp-enable-on-type-formatting t
              lsp-enable-file-watchers t
              lsp-headerline-breadcrumb-enable t)

        ;; LSP UI tweaks
        (require 'lsp-ui)
        (setq lsp-ui-doc-enable t
              lsp-ui-doc-position 'bottom
              lsp-ui-sideline-enable t
              lsp-ui-sideline-show-diagnostics t)

        ;; Company (completion) configuration
        (require 'company)
        (setq company-minimum-prefix-length 1
              company-idle-delay 0.0
              company-tooltip-align-annotations t)
        (require 'company-box)
        (add-hook 'company-mode-hook 'company-box-mode)

        ;; Treesitter setup
        (require 'tree-sitter)
        (require 'tree-sitter-langs)
        (global-tree-sitter-mode)
        (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

        ;; Ivy setup
        (ivy-mode 1)
        (counsel-mode 1)
        (require 'ivy-rich)
        (ivy-rich-mode 1)

        ;; Projectile configuration
        (require 'projectile)
        (projectile-mode +1)
        (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

        ;; Language specific setups
        ;; Rust
        (require 'rustic)
        (setq rustic-lsp-server 'rust-analyzer)

        ;; Python
        (add-hook 'python-mode-hook 'lsp-deferred)
        (setq python-indent-guess-indent-offset t)
        (setq python-indent-guess-indent-offset-verbose nil)

        ;; C/C++
        (add-hook 'c-mode-hook 'lsp-deferred)
        (add-hook 'c++-mode-hook 'lsp-deferred)

        ;; Go
        (require 'go-mode)
        (add-hook 'go-mode-hook 'lsp-deferred)

        ;; Format on save
        (setq +format-with-lsp nil)
        (add-hook 'before-save-hook 'format-all-buffer)

        ;; Custom keybindings
        (global-set-key (kbd "C-s") 'swiper)
        (global-set-key (kbd "M-x") 'counsel-M-x)
        (global-set-key (kbd "C-x C-f") 'counsel-find-file)
        (global-set-key (kbd "C-c f") 'format-all-buffer)
        (global-set-key (kbd "C-c g") 'magit-status)
      '';
    };
  };
}
