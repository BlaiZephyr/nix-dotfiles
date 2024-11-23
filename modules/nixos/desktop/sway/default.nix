{
  config,
  lib,
  pkgs,
  ...
}: {
  options.desktop = {
    sway.enable = lib.mkEnableOption "enable sway";
  };

  config = lib.mkIf config.desktop.sway.enable {
    environment.variables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "sway";
    };

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.sway}/bin/sway";
          user = "melonix";
        };
        default_session = initial_session;
      };
    };

    home-manager.users."melonix" = {
      home.packages = with pkgs; [
        grim
        slurp
        wl-clipboard
        swappy
        imagemagick
      ];

      services.dunst = {
        enable = true;
        settings = {
          global = {
            origin = "top-right";
            offset = "12x12";
            idle_threshold = 120;
          };
        };
      };

      programs.gpg = {
        enable = true;
      };

      services.gpg-agent = {
        enable = true;
      };

      wayland.windowManager.sway = {
        enable = true;

        wrapperFeatures = {
          base = true;
          gtk = true;
        };

        config = {
          bars = [
            {
              position = "top";
            }
          ];
          modifier = "Mod4";
          startup = [
            {
              command = "kitty";
            }
          ];

          output = {
            "DP-2" = {
              mode = "1920x1080@239.964Hz";
              position = "0 0";
              max_render_time = "1"; # Reduce frame timing variance
            };
            "DP-3" = {
              mode = "1920x1080@239.964Hz";
              position = "1920 0";
              max_render_time = "1";
            };
          };

          input = {
            "type:keyboard" = {
              xkb_layout = "de";
            };
          };

          keybindings = {
            "Mod4+space" = "exec rofi -show drun";
            "Mod4+f" = "fullscreen";
            "Mod4+Return" = "exec kitty";
            "Mod4+b" = "exec firefox";

            "Mod4+Left" = "focus left";
            "Mod4+Right" = "focus right";
            "Mod4+Up" = "focus up";
            "Mod4+Down" = "focus down";

            "Mod4+Shift+Left" = "move left";
            "Mod4+Shift+Right" = "move right";
            "Mod4+Shift+Up" = "move up";
            "Mod4+Shift+Down" = "move Down";

            "Mod4+1" = "workspace number 1";
            "Mod4+2" = "workspace number 2";
            "Mod4+3" = "workspace number 3";
            "Mod4+4" = "workspace number 4";
            "Mod4+5" = "workspace number 5";
            "Mod4+6" = "workspace number 6";
            "Mod4+7" = "workspace number 7";

            "Mod4+KP_1" = "workspace number 1";
            "Mod4+KP_2" = "workspace number 2";
            "Mod4+KP_3" = "workspace number 3";
            "Mod4+KP_4" = "workspace number 4";
            "Mod4+KP_5" = "workspace number 5";
            "Mod4+KP_6" = "workspace number 6";
            "Mod4+KP_7" = "workspace number 7";

            "Mod4+shift+1" = "move container to workspace number 1";
            "Mod4+shift+2" = "move container to workspace number 2";
            "Mod4+shift+3" = "move container to workspace number 3";
            "Mod4+shift+4" = "move container to workspace number 4";
            "Mod4+shift+5" = "move container to workspace number 5";
            "Mod4+shift+6" = "move container to workspace number 6";
            "Mod4+shift+7" = "move container to workspace number 7";

            "Mod4+shift+KP_1" = "move container to workspace number 1";
            "Mod4+shift+KP_2" = "move container to workspace number 2";
            "Mod4+shift+KP_3" = "move container to workspace number 3";
            "Mod4+shift+KP_4" = "move container to workspace number 4";
            "Mod4+shift+KP_5" = "move container to workspace number 5";
            "Mod4+shift+KP_6" = "move container to workspace number 6";
            "Mod4+shift+KP_7" = "move container to workspace number 7";

            #screenshot tools
            "Mod4+shift+q" = "kill";
            "Print" = "exec grim -g \"$(slurp)\" - | swappy -f -"; # Select area with editing
            "Shift+Print" = "exec grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | swappy -f -";
            "Ctrl+Print" = "exec grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy";
            "Ctrl+Shift+Print" = "exec grim - | swappy -f -";
          };

          terminal = "kitty";
          menu = "bemenu-run";

          gaps.inner = 10;
          window.border = 4;
        };

        extraSessionCommands = ''
          export SDL_VIDEODRIVER=wayland
          export XDG_CURRENT_DESKTOP=sway
          export XDG_SESSION_TYPE=wayland
          export QT_QPA_PLATFORM=wayland
          export __GL_GSYNC_ALLOWED=1
          export __GL_VRR_ALLOWED=1
        '';
      };
    };
  };
}
