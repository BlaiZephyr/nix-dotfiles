{ pkgs, config, ... }:
{

  hm.programs.alacritty = {
    enable = true;
    settings = {
      shell = "/etc/profiles/per-user/melonix/bin/bash";
    };
  };

  hm.programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      nhbuild = "nh os build ~/.dotfiles/";
      nhswitch = "nh os switch ~/.dotfiles/";
      config = "cd /etc/nixos";
    };
    bashrcExtra = ''
      eval "$(direnv hook bash)"
    '';
  };

  hm.programs.starship = {
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

  hm.programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.global = {
      hide_env_diff = true;
    };
  };

  hm.programs.git = {
    enable = true;
    userName = "BlaiZephyr";
    userEmail = "arbeit.t.lechner@gmail.com";
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 12d --keep 3";
    flake = "/home/melonix/.dotfiles/";
  };
}
