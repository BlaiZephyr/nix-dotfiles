{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    zsh
    nix-output-monitor
    nvd
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 14;
      shell = "/etc/profiles/per-user/melonix/bin/zsh";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      vim = "lvim";
      nvim = "lvim";
      vi = "lvim";
      nhbuild = "nh os build /etc/nixos";
      nhswitch = "nh os switch /etc/nixos";
      config = "cd /etc/nixos";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  #programs.fish = {
  #enable = true;
  #shellAliases = {
  #vi = "lvim";
  #vim = "lvim";
  #nvim = "lvim";
  #interactiveShellInit = ''
  #eval (ssh-agent -c)
  #direnv hook fish | source
  #'';
  #};
  #};


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
}
