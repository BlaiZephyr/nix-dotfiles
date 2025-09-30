# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

Project: ZaneyOS — NixOS flake for desktop systems with per-host overrides, GPU/VM profiles, and an integrated Home Manager layer.

Important repo expectations
- This repo is expected at: ~/zaneyos (programs.nh.flake points here). If you keep it elsewhere, update modules/core/nh.nix accordingly.
- Target OS: NixOS 23.11+; UEFI + GPT expected; systemd-boot is supported out of the box (see README for details).

Common commands
- Rebuild and switch (preferred via nh/zcli)
  - fr            # zsh alias → nh os switch --hostname <profile>
  - fu            # zsh alias → nh os switch --hostname <profile> --update
  - zcli rebuild [--dry|--ask|--cores N|--verbose|--no-nom]
  - zcli update  [--dry|--ask|--cores N|--verbose|--no-nom]
- Rebuild for next boot (safer for bigger changes)
  - zcli rebuild-boot [same options]
  - sudo nixos-rebuild boot --flake .#<profile>
- Direct NixOS (without nh/zcli)
  - sudo nixos-rebuild switch --flake .#<profile>
- Validate the flake
  - nix flake check
- Format Nix files (nixfmt-rfc-style is included)
  - find . -name "*.nix" -print0 | xargs -0 nixfmt
- Host management (zcli)
  - zcli update-host [hostname] [profile]  # auto-detect if args omitted
  - zcli add-host <hostname> [profile]     # copies hosts/default, can gen hardware.nix
  - zcli del-host <hostname>
- Diagnostics and maintenance
  - zcli diag           # writes ~/diag.txt
  - zcli cleanup        # prunes generations (interactive)
  - zcli trim           # runs fstrim with confirmation
- 2.3 → 2.4 upgrade (existing installs)
  - ./upgrade-2.3-to-2.4.sh        # automated analysis, backup, and upgrade
  - ./upgrade-2.3-to-2.4.sh --revert

Notes on profiles and hosts
- Profiles represent hardware targets: amd, intel, nvidia, nvidia-laptop (intel+NVIDIA hybrid), amd-hybrid (AMD+NVIDIA hybrid), vm.
- Use the profile in flake targets like .#vm or .#nvidia, or via nh’s --hostname.
- Host-specific settings live under hosts/<hostname>/; variables.nix holds UX and feature toggles.

High-level architecture (big picture)
- flake.nix
  - Inputs: nixpkgs 25.05, home-manager 25.05, stylix, nvf, nix-flatpak.
  - Defines system, host, profile, username; constructs nixosConfigurations via mkNixosConfig.
  - Each configuration imports profiles/<profile>.
- profiles/<profile>/default.nix
  - Imports host and stacks: ../../hosts/${host}, ../../modules/drivers, ../../modules/core.
  - Toggles drivers and VM guest services per profile; the nvidia-laptop and amd-hybrid profiles consume Bus IDs from host variables.
- hosts/<hostname>/
  - default.nix imports hardware.nix and host-packages.nix.
  - variables.nix is the primary control surface (display manager, terminal/browser defaults, waybarChoice, stylix image, 24h clock, Thunar/printing/NFS flags, intel/nvidia Bus IDs, etc.).
- modules/core
  - Composes NixOS modules: boot, flatpak, fonts, hardware, network, nfs, nh, packages, printing, display manager (greetd/sddm), security, services (PipeWire/SSH/Bluetooth/fstrim; smartd conditional), steam, stylix, syncthing, system (nix settings, locales, env), thunar, user (Home Manager), virtualization, xserver.
  - nh.nix enables nh and pins programs.nh.flake to ~/zaneyos.
  - user.nix integrates Home Manager and creates users.${username}, passing { inputs, username, host, profile } to the home layer.
- modules/drivers
  - AMD, Intel, NVIDIA, NVIDIA Prime, NVIDIA AMD-Hybrid, and VM guest services; nvidia-prime options (enable, intelBusID, nvidiaBusID) are consumed by the nvidia-laptop profile; nvidia-amd-hybrid options (enable, amdgpuBusID, nvidiaBusID) are consumed by the amd-hybrid profile.
- modules/home
  - Composes the user environment: Hyprland, Waybar (via waybarChoice), Rofi, Yazi, terminals (Kitty/WezTerm/Ghostty/Alacritty toggles), Zsh/Bash config, Git, NVF/Neovim, OBS, swaync, scripts, Stylix, optional Doom Emacs/VSCodium/Helix.
  - scripts/default.nix installs zcli; zcli wraps rebuild/update/boot, cleanup, diagnostics, host management, and Doom lifecycle.
- Shell aliases (zsh)
  - fr and fu are defined in modules/home/zsh/default.nix, parameterized by the active profile.

Key development choices
- Repo location matters: nh and zcli assume ~/zaneyos; move it and adjust modules/core/nh.nix.
- Validation is via nix flake check; there is no separate unit test suite.
- Formatting is via nixfmt-rfc-style (provided in system packages).

Useful docs in-repo
- README.md: requirements, install and upgrade overview (including the 2.3→2.4 process).
- zcli.md: full CLI docs, commands, options, and examples.
- cheatsheets/project-guide.md: quick commands, architecture summary, and common workflows.
- cheatsheets/: Hyprland and terminal/editor quick references.


