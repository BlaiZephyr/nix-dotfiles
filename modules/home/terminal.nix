{ ... }: {

programs.alacritty = {
enable = true;
settings = {
font.size = 14;
shell.program = "/etc/profiles/per-user/melonix/bin/fish";
	};
    };

programs.fish = {
enable = true;
shellAliases = {
vi = "lvim";
vim = "lvim";
nvim = "lvim";
interactiveShellInit = ''
eval (ssh-agent -c)
'';
};
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
}

