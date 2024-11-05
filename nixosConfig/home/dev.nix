{pkgs, ...}: {
  home.packages = with pkgs; [
    #core tools
    vscode-fhs
    libsForQt5.full
    devenv

    nixpkgs-review
    gh
    git

    nixpkgs-fmt
  ];
  programs.helix = {
    enable = true;
    themes = {
      gruvy = {
        inherits = "gruvbox";
        "ui.background" = {
          fg = "foreground";
          bg = "background";
        };

        "comment" = {
          fg = "gray1";
          modifiers = ["italic"];
        };
        "keyword" = {
          fg = "red1";
          modifiers = ["italic"];
        };
        "keyword.function" = {
          fg = "red1";
          modifiers = ["italic"];
        };
        "markup.italic" = {modifiers = ["italic"];};
        "markup.quote" = {modifiers = ["italic"];};
      };
    };
    settings = {
      theme = "gruvy";
      editor = {
        auto-format = true;
        completion-trigger-len = 0;
        scroll-lines = 1;
        scrolloff = 5;
        cursorline = true;
        color-modes = true;
        indent-guides.render = true;
        file-picker.hidden = false;
        auto-pairs = false;
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
        };
        bufferline = "always";
        statusline = {
          left = ["mode" "spinner" "file-name"];
          right = ["diagnostics" "position" "total-line-numbers" "file-encoding"];
          center = ["version-control"];
        };
        soft-wrap = {
          enable = true;
        };
      };

      keys.normal.space = {
        "h" = ":toggle-option lsp.display-inlay-hints";
        "c" = [":write-all"];
        # f and F are swapped, as picking in cwd is much more common for me.
        "f" = "file_picker_in_current_directory";
        "F" = "file_picker";
      };
    };

    languages = {
      language = [
        {
          name = "svelte";
          formatter = {
            command = "prettier";
            args = ["--parser" "svelte"];
          };
          auto-format = true;
        }
        {
          name = "typescript";
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
          auto-format = true;
        }
        {
          name = "json";
          formatter = {
            command = "prettier";
            args = ["--parser" "json"];
          };
          auto-format = true;
        }
        {
          name = "nix";
          formatter = {command = "nixpkgs-fmt";};
          auto-format = true;
        }
        {
          name = "xml";
          formatter = {
            command = "xmllint";
            auto-format = true;
            args = ["--format" "-"];
          };
        }
      ];

      language-server = {
        rust-analyzer = {
          config = {
            checkOnSave.command = "clippy";
            # Careful! If you enable this, then a lot of errors
            # will no longer show up in Helix. Do not enable it.
            # cargo.allFeatures = true; <- do NOT enable me
          };
        };
      };
    };
  };
}
