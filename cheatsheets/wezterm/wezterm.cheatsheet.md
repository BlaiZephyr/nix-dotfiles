# WezTerm on ddubsOS — Summary & Cheatsheet

## 🚀 Summary of modules/home/terminals/wezterm.nix

- Program
  - WezTerm enabled with package pkgs.wezterm
  - Lua config provided at ~/.config/wezterm/wezterm.lua

- Appearance & Behavior
  - Hide tab bar if only one tab
  - Font fallback chain: Maple Mono NF (thin), Fira Code, JetBrains Mono, Hack
  - Font: FiraCode Regular (window frame: JetBrainsMono Nerd Font Mono); size: 12
  - Color scheme: Catppuccin Mocha; custom tab bar colors
  - Window background opacity: 0.75; padding: 10 on all sides
  - Fancy tab bar enabled; custom window_frame font
  - Cursor: BlinkingUnderline, blink rate 500
  - Term: xterm-256color
  - Performance: max_fps 120; animation_fps 30
  - Wayland: enable_wayland = true
  - Missing glyph warnings: disabled

---

## 🗝️ Keybindings Cheatsheet

Tabs
- Alt+t — Spawn tab (CurrentPaneDomain)
- Alt+w — Close current tab (no confirm)
- Alt+n — Next tab
- Alt+p — Previous tab

Panes
- Alt+v — Split vertical
- Alt+h — Split horizontal
- Alt+q — Close current pane (no confirm)
- Alt+Arrow keys — Activate pane in arrow direction

Notes
- Lua contains optional NVIDIA-related tuning commented out.
- default_prog can be enabled if Starship prompt has startup issues.

