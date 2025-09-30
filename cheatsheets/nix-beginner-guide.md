# ZaneyOS Beginner’s Guide to Customization

Welcome! This guide is for users who are new to Nix and want to make common, safe customizations to their ZaneyOS setup. We’ll keep it simple and focus on essentials.

## Repository layout (where to change things)

- `flake.nix`: Entry point for the whole system. You generally don’t need to edit this for day‑to‑day tweaks.
- `hosts/`: Per‑machine configuration.
  - `hosts/<your-hostname>/`
    - `variables.nix`: Your main control panel (enable/disable features, set options).
    - `host-packages.nix`: Extra packages only for this one machine.
- `modules/`: Reusable building blocks for the system and Home Manager.
  - `modules/core/global-packages.nix`: Packages installed on all machines.
  - `modules/home/hyprland/binds.nix`: Hyprland keybindings.

## Installing packages

Two common patterns:

### 1) Only on this machine
Edit `hosts/<your-hostname>/host-packages.nix` and add the package name:

```nix
[
  brave
  (catppuccin-vsc.override {
    variant = "mocha";
  })
  cowsay
]
```

### 2) On all machines
Edit `modules/core/global-packages.nix` and add the package to the list.

## Monitor settings (per host)

Edit `hosts/<your-hostname>/variables.nix` and set the extra monitor line(s):

```nix
# Example: 1080p at 144 Hz on DP-1
extraMonitorSettings = "monitor=DP-1,1920x1080@144";
```

## Change Hyprland keybindings

Edit `modules/home/hyprland/binds.nix`. For example, change terminal from Super+Return to Super+T:

```nix
"SUPER, T, exec, ${terminal}"
```

## Apply and test your changes

Preferred (ZaneyOS-specific):
- `zcli rebuild`
  - Note: The `fr` alias is deprecated.

Manual backup method (works anywhere):
- From the repo root, replace PROFILE with your profile (intel, nvidia, nvidia-laptop, amd-hybrid, vm):
  - `sudo nixos-rebuild switch --flake .#PROFILE`

Tips
- If a rebuild fails, read the error near the bottom of the output—it usually points to the exact file/line.
- If a change breaks your session after a reboot, pick an older “generation” from the boot menu to roll back.
- Use Git to track your edits so you can revert easily.

