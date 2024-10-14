{pkgs, ...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      shell = "/etc/profiles/per-user/melonix/bin/bash";

      window = {
        opacity = 0.8;
        blur = true;
        title = "let melon cook";
        dynamic_title = true;
      };
    };
  };

  programs.fzf = {
    enable = true;
    colors = {
      fg = "#cbccc6";
      bg = "#1f2430";
      hl = "#707a8c";
      "fg+" = "#707a8c";
      "bg+" = "#191e2a";
      "hl+" = "#ffcc66";
      info = "#73d0ff";
      prompt = "#707a8c";
      pointer = "#cbccc6";
      marker = "#73d0ff";
      spinner = "#73d0ff";
      header = "#d4bfff";
    };
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      nhbuild = "nh os build ~/.dotfiles/";
      nhswitch = "nh os switch ~/.dotfiles/";
      config = "cd ~/.dotfiles/";
      searchpkg = "nix search nixpkgs --json | nix run nixpkgs#jq -- -r '. | keys[]' | cut -d \. -f 3- | fzf";
    };
    bashrcExtra = ''
      eval "$(direnv hook bash)"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      username = {
        style_user = "blue bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        ssh_symbol = "🌐 ";
        format = "on [$hostname](bold red) ";
        trim_at = ".local";
        disabled = false;
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.global = {
      hide_env_diff = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "BlaiZephyr";
    userEmail = "arbeit.t.lechner@gmail.com";
  };

  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      cpu
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '5'
        '';
      }
    ];
  };
}
