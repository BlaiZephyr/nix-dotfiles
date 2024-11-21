{
  config,
  lib,
  pkgs,
  ...
}: {
  options.hm = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.hm.waybar.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;

      style = ''
        * {
          all: unset;
          font-family: "JetBrainsMono Nerd Font";
          font-size: 14px;
          transition-property: background-color, opacity, box-shadow;
          transition-duration: 0.2s;
          transition-timing-function: ease-out;
        }

        #waybar {
          background: transparent;
        }

        window#waybar {
          background: transparent;
          margin-right: 16px;  /* Increased margin from screen edge */
        }

        window#waybar > box {
          margin: 6px;
          padding: 3px;
          animation: slideIn 0.5s ease-out;
        }

        @keyframes slideIn {
          from {
            opacity: 0;
          }
          to {
            opacity: 1;
          }
        }

        #custom-toggle {
          padding: 8px;
          color: #cdd6f4;
          background: #11111b;
          border-radius: 6px;
          margin: 3px;
          opacity: 0.8;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2),
                      0 1px 2px rgba(0, 0, 0, 0.1);
          }

        #custom-toggle.active {
          opacity: 1;
          background: #1e1e2e;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15),
                      0 2px 4px rgba(0, 0, 0, 0.12);
        }

        #{
          opacity: 1;
          box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2),
                      0 4px 8px rgba(0, 0, 0, 0.15);
          background: #1a1b26;
        }
      '';

      settings = [
        {
          layer = "top";
          position = "right";
          width = 38; # Slightly wider to accommodate shadow
          spacing = 3;
          margin = "12px 16px 0 0"; # Increased top and right margins
          ipc = true;

          modules-right = ["custom/toggle"];

          "custom/toggle" = {
            format = ""; # Clean toggle icon
            on-click = "${pkgs.writeShellScript "toggle-waybar" ''
              CURRENT_STATE=$(cat /tmp/waybar-toggle-state 2>/dev/null || echo "0")
              if [ "$CURRENT_STATE" = "1" ]; then
                echo "0" > /tmp/waybar-toggle-state
                echo '{"class": ""}' > $SWAYSOCK.wob
              else
                echo "1" > /tmp/waybar-toggle-state
                echo '{"class": "active"}' > $SWAYSOCK.wob
              fi
            ''}";
            return-type = "json";
            exec = "${pkgs.writeShellScript "get-toggle-state" ''
              CURRENT_STATE=$(cat /tmp/waybar-toggle-state 2>/dev/null || echo "0")
              if [ "$CURRENT_STATE" = "1" ]; then
                echo '{"class": "active"}'
              else
                echo '{"class": ""}'
              fi
            ''}";
            interval = 1;
          };
        }
      ];
    };
  };
}
