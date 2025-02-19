{...}: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      font-thicken = true;
      font-feature = ["ss04" "ss01"];
      bold-is-bright = false;
      adjust-box-thickness = 1;
      cursor-style = "bar";
      cursor-style-blink = false;
      adjust-cursor-thickness = 1;
      mouse-hide-while-typing = true;
      title = "GhosTTY";
      gtk-single-instance = true;
    };
  };
}
