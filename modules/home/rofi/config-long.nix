{...}: {
  home.file.".config/rofi/config-long.rasi".text = ''
    @import "~/.config/rofi/config.rasi"
    entry {
      placeholder: "🔎 Search       ";
    }
    listview {
      columns: 1;
      lines: 10;
    }
  '';
}
