# Kitty on ddubsOS — Summary & Cheatsheet

## 🚀 Summary of modules/home/terminals/kitty.nix

- Program
  - Kitty enabled with package pkgs.kitty
  - Shell integrations: Zsh, Fish, Bash (mode: enabled)

- Appearance & Behavior
  - Font: Maple Mono NF, size 12
  - Scrollback: 10,000 lines; wheel min lines: 1; padding: 4px
  - Confirm close: 0 (no confirm); audio bell: disabled; mouse hide wait: 60
  - Cursor trail: 1; tab fade: 1; active/inactive tab font style: bold
  - Tab bar: top, powerline style
  - Layouts: splits enabled
  - URL handling: open with default; detect URLs: true; allow_remote_control: true

- Theme (Catppuccin Mocha manual config in extraConfig)
  - Foreground/background, selection, cursor, borders, tab bar, and 16-color palette explicitly set

---

## 🗝️ Keybindings Cheatsheet (extraConfig)

Clipboard
- Ctrl+Shift+V — paste_from_selection
- Shift+Insert — paste_from_selection

Scrollback
- Ctrl+Shift+Up / k — scroll_line_up
- Ctrl+Shift+Down / j — scroll_line_down
- Ctrl+Shift+PageUp — scroll_page_up
- Ctrl+Shift+PageDown — scroll_page_down
- Ctrl+Shift+Home — scroll_home
- Ctrl+Shift+End — scroll_end
- Ctrl+Shift+H — show_scrollback

Windows/Tabs/Layout
- Alt+N — new_window_with_cwd
- Alt+W — close_window
- Ctrl+Shift+Enter — split horizontal (hsplit)
- Ctrl+Shift+S — split vertical (vsplit)
- Ctrl+Shift+] / [ — next_window / previous_window
- Ctrl+Shift+F — move_window_forward
- Ctrl+Shift+B — move_window_backward
- Ctrl+Shift+` — move_window_to_top
- Ctrl+Shift+1..0 — first..tenth_window
- Ctrl+Shift+Right/Left — next_tab / previous_tab
- Ctrl+Shift+T — new_tab
- Ctrl+Shift+Q — close_tab
- Ctrl+Shift+L — next_layout
- Ctrl+Shift+. / , — move_tab_forward / move_tab_backward

Font Size
- Ctrl+Shift+Up — increase_font_size
- Ctrl+Shift+Down — decrease_font_size
- Ctrl+Shift+Backspace — restore_font_size

Notes
- Color scheme is embedded; Stylix support disabled in this config.

