# A Guide to Customizing Hyprland in ZaneyOS

This guide provides a practical overview for customizing your Hyprland experience in ZaneyOS. We’ll cover the most relevant files, what they do, and small, safe edits you can make.

Note: These files are written in Nix. A small syntax error can break builds. Make one change at a time and keep your edits under version control.

## Applying your changes

Preferred (ZaneyOS-specific):
- `zcli rebuild`
  - Note: The `fr` alias is deprecated.

Manual backup method (works anywhere):
- From the repo root, replace PROFILE with your profile (intel, nvidia, nvidia-laptop, amd-hybrid, vm):
  - `sudo nixos-rebuild switch --flake .#PROFILE`

---

### `binds.nix` — Keybindings

Controls keyboard and mouse shortcuts.

Location: `modules/home/hyprland/binds.nix`

Format: `MODIFIER, KEY, DISPATCHER, VALUE`

Example: Change terminal from Super+Return to Super+T

```nix
# ...
  bind = [
    # ...
    "$modifier,T,exec, ${terminal}"
    # ...
  ];
# ...
```

---

### `exec-once.nix` — Startup applications

Commands that start automatically with Hyprland.

Location: `modules/home/hyprland/exec-once.nix`

Example: Add copyq to autostart

```nix
# ...
  exec-once = [
    # ...
    "pypr &"
    "copyq"
  ];
# ...
```

---

### `decoration.nix` — Borders, shadows, blur

Location: `modules/home/hyprland/decoration.nix`

Example: Rounded corners

```nix
# ...
  decoration = {
    rounding = 10;
  };
# ...
```

---

### `env.nix` — Environment variables

Location: `modules/home/hyprland/env.nix`

Example: Enable Wayland for Firefox

```nix
# ...
  env = [
    "SDL_VIDEODRIVER, wayland"
    "MOZ_ENABLE_WAYLAND, 1"
  ];
# ...
```

---

### `gestures.nix` — Touchpad gestures

Location: `modules/home/hyprland/gestures.nix`

Example: Disable workspace swipe

```nix
# ...
  gestures = {
    workspace_swipe = 0;
  };
# ...
```

---

### `misc.nix` — Misc settings

Location: `modules/home/hyprland/misc.nix`

Example: Enable Variable Refresh Rate

```nix
# ...
  misc = {
    vrr = 1;
  };
# ...
```

---

### `hyprland.nix` — Main configuration

Location: `modules/home/hyprland/hyprland.nix`

Example: Keyboard layout

```nix
# ...
  input = {
    kb_layout = "us";
  };
# ...
```

---

### `windowrules.nix` — Window rules

Location: `modules/home/hyprland/windowrules.nix`

Example: Float Thunar always

```nix
# ...
  windowrule = [
    "float, class:^(foot-floating)$"
    "float, class:^(Thunar)$"
  ];
# ...
```

---

## Helpful tips

- Make one change at a time and rebuild to validate.
- Keep a terminal open during experiments in case your launcher keybind changes.
- If something breaks, reboot and choose a previous generation in the boot menu.

