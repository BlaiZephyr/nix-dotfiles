{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        color = {
          keys = "35";
          output = "90";
        };
        separator = " ➜  ";
      };

      logo = {
        source = ./nixos.png;
        type = "kitty-direct";
        height = 10;
        width = 20;
        padding = {
          top = 2;
          left = 2;
        };
      };

      modules = [
        "break"
        {
          type = "cpu";
          format = "{1} ({3}) @ {7}";
          key = "HW   ";
        }
        {
          type = "gpu";
          key = " ├ 󰍛 ";
        }
        {
          type = "memory";
          key = " └  ";
        }
        "break"
        {
          type = "kernel";
          key = "SW   ";
        }
        {
          type = "packages";
          key = " ├ 󰏖 ";
        }
        {
          type = "shell";
          key = " └  ";
        }
        "break"
        {
          type = "wm";
          key = "WM   ";
        }
        {
          type = "wmtheme";
          key = " ├ 󰉼 ";
        }
        {
          type = "terminal";
          key = " └  ";
        }
        "break"
        {
          type = "uptime";
          key = "UP   ";
        }
        {
          type = "command";
          key = " └  ";
          text =
            #bash
            ''
              birth_install=$(stat -c %W /)
              current=$(date +%s)
              delta=$((current - birth_install))
              delta_days=$((delta / 86400))
              echo $delta_days days
            '';
        }
        "break"
      ];
    };
  };
}
