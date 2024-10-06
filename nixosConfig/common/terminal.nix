{ config, ... }: {

    hm.programs.alacritty = {
    enable = true;
    settings = {
      font.size = 14;
      shell = "/etc/profiles/per-user/melonix/bin/zsh";
    };
  };

  hm.programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      vim = "lvim";
      nvim = "lvim";
      vi = "lvim";
      nhbuild = "nh os build ~/.dotfiles/";
      nhswitch = "nh os switch ~/.dotfiles/";
      config = "cd /etc/nixos";
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
};
}
