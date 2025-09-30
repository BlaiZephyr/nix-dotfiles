# Ghostty on ddubsOS — Summary & Cheatsheet

## 🚀 Summary of modules/home/terminals/ghostty.nix

- Program
  - Ghostty enabled with Nix package: pkgs.ghostty
  - Shell integrations: Fish, Zsh, Bash
  - clearDefaultKeybinds = true (all bindings are explicitly defined below)

- Appearance
  - Title: ddubsOS-GhosTTY
  - TERM: xterm-256color
  - Theme: dark: catppuccin-mocha; light: catppuccin-mocha
  - Window theme: dark
  - Font: Maple Mono NF, size 12
  - Cell height adjustment: +10%
  - Background opacity: 1.00 (opaque)
  - Background blur radius: 60
  - Cursor style: bar
  - Selection colors: bg #2d3f76, fg #c8d3f5
  - Unfocused split opacity: 0.5
  - Quick terminal position: center

- Window and Behavior
  - Default window size: 110x32 (cols x rows)
  - Confirm close surface: false
  - Wait after command: false
  - Shell integration: detect; features: cursor, sudo
  - Window save state: always
  - GTK single instance: true
  - Mouse: hide while typing: true

- Keybindings (Super/Alt prefix scheme)
  - Custom leader-like chord uses Alt+s then key, e.g. alt+s>c
  - Standard clipboard and font size with Ctrl+Shift chords
  - Tabs, splits, navigation, zoom, equalize defined below

---

## 🗝️ Keybindings Cheatsheet

Clipboard
- Ctrl+Shift+C — copy_to_clipboard
- Ctrl+Shift+V — paste_from_clipboard

Font size
- Ctrl+Shift+= (plus) — increase_font_size:1
- Ctrl+Shift+- (minus) — decrease_font_size:1
- Ctrl+Shift+0 — reset_font_size

Session
- Alt+s r — reload_config
- Alt+s x — close_surface
- Alt+s n — new_window

Tabs
- Alt+s c — new_tab
- Alt+s Shift+L — next_tab
- Alt+s Shift+H — previous_tab
- Alt+s , — move_tab:-1
- Alt+s . — move_tab:+1
- Alt+s 1..9 — goto_tab:N

Splits
- Alt+s \ — new_split:right
- Alt+s - — new_split:down
- Alt+s j — goto_split:bottom
- Alt+s k — goto_split:top
- Alt+s h — goto_split:left
- Alt+s l — goto_split:right
- Alt+s z — toggle_split_zoom
- Alt+s e — equalize_splits

Notes
- clearDefaultKeybinds = true means only the above are active.
- The Alt+s> notation denotes a two-key chord: hold Alt, press s, then the next key.

---

## ⚙️ Default Options Reference (as configured)

Terminal and window
- term: xterm-256color
- window-width: 110
- window-height: 32
- window-theme: dark
- window-save-state: always
- gtk-single-instance: true
- quick-terminal-position: center

Appearance
- theme: catppuccin-mocha (dark and light mapped to mocha)
- font-family: Maple Mono NF
- font-size: 12
- adjust-cell-height: 10%
- background-opacity: 1.00
- background-blur-radius: 60
- selection-background: #2d3f76
- selection-foreground: #c8d3f5
- cursor-style: bar
- unfocused-split-opacity: 0.5

Behavior
- confirm-close-surface: false
- mouse-hide-while-typing: true
- wait-after-command: false
- shell-integration: detect
- shell-integration-features: cursor,sudo

Integrations
- Fish, Zsh, Bash integrations enabled

---

## 📝 Style/Formatting Notes

This cheatsheet mirrors your Emacs cheatsheets style:
- Clear section headers with emoji
- Bulleted lists with concise descriptions
- Short “Notes” blocks for special behaviors

If you’d like, I can link this from a central index or add more Ghostty tips (themes, performance flags, troubleshooting).
