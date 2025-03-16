{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
  };
  home.file."./.config/ghostty/config".text = ''

    #theme = Aura
    theme = Dracula
    #theme = Aardvark Blue
    #theme = GruvboxDarkHard
    adjust-cell-height = 10%
    window-theme = dark
    window-height = 32
    window-width = 110
    background-opacity = 0.95
    background-blur-radius = 60
    selection-background = #2d3f76
    selection-foreground = #c8d3f5
    cursor-style = bar
    mouse-hide-while-typing = true

    # keybindings
    keybind = alt+s>r=reload_config
    keybind = alt+s>x=close_surface

    keybind = alt+s>n=new_window

    # tabs
    keybind = alt+s>c=new_tab
    keybind = alt+s>shift+l=next_tab
    keybind = alt+s>shift+h=previous_tab
    keybind = alt+s>comma=move_tab:-1
    keybind = alt+s>period=move_tab:1

    # quick tab switch
    keybind = alt+s>1=goto_tab:1
    keybind = alt+s>2=goto_tab:2
    keybind = alt+s>3=goto_tab:3
    keybind = alt+s>4=goto_tab:4
    keybind = alt+s>5=goto_tab:5
    keybind = alt+s>6=goto_tab:6
    keybind = alt+s>7=goto_tab:7
    keybind = alt+s>8=goto_tab:8
    keybind = alt+s>9=goto_tab:9

    # split
    keybind = alt+s>\=new_split:right
    keybind = alt+s>-=new_split:down

    keybind = alt+s>j=goto_split:bottom
    keybind = alt+s>k=goto_split:top
    keybind = alt+s>h=goto_split:left
    keybind = alt+s>l=goto_split:right

    keybind = alt+s>z=toggle_split_zoom

    keybind = alt+s>e=equalize_splits

    # other
    #copy-on-select = clipboard

    font-size = 12
    #font-family = JetBrainsMono Nerd Font Mono
    #font-family-bold = JetBrainsMono NFM Bold
    #font-family-bold-italic = JetBrainsMono NFM Bold Italic
    #font-family-italic = JetBrainsMono NFM Italic

    font-family = BerkeleyMono Nerd Font
    #font-family = Iosevka Nerd Font
    # font-family = SFMono Nerd Font

    title = "GhosTTY"

    wait-after-command = false
    shell-integration = detect
    window-save-state = always
    gtk-single-instance = true
    unfocused-split-opacity = 0.5
    quick-terminal-position = center
    shell-integration-features = cursor,sudo
  '';
}
