{
  pkgs,
  lib,
  config,
  ...
}: {
  options.hm = {
    shell.enable = lib.mkEnableOption "enables the bash shell with some utils";
  };

  config = lib.mkIf config.hm.shell.enable {
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
  };
}
