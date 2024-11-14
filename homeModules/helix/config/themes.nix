{...}: {
  programs.helix = {
    themes = {
      gruvy = {
        inherits = "gruvbox";
        "ui.background" = {
          fg = "foreground";
          bg = "background";
        };

        "comment" = {
          fg = "gray1";
          modifiers = ["italic"];
        };
        "keyword" = {
          fg = "red1";
          modifiers = ["italic"];
        };
        "keyword.function" = {
          fg = "red1";
          modifiers = ["italic"];
        };
        "markup.italic" = {
          modifiers = ["italic"];
        };
        "markup.quote" = {
          modifiers = ["italic"];
        };
      };
    };
  };
}
