{...}: {
  home.file.".config/rofi/config-wide.rasi".text = ''
    @import "~/.config/rofi/config-long.rasi"
    window {
      width: 100%;
      location: south;
      anchor: south;
    }
  '';
}
