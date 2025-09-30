# Project Guide — ZaneyOS

Scope
- A reproducible NixOS flake tailored for desktop systems with per-host overrides, GPU/VM profiles, and an integrated Home Manager layer (Hyprland, Waybar, shells, scripts).
- Repo location is expected at ~/zaneyos. If you place it elsewhere, update modules/core/nh.nix (programs.nh.flake) to the new path.

Quick commands
- Build and switch (preferred: nh/zcli)
  - fr  → nh os switch --hostname <profile>    # alias provided by zsh/bash modules
  - fu  → nh os switch --hostname <profile> --update
  - zcli rebuild
  - zcli update
- Build for next boot (safer for larger changes)
  - zcli rebuild-boot
  - or: sudo nixos-rebuild boot --flake .#<profile>
- Direct NixOS (if you prefer without nh/zcli)
  - sudo nixos-rebuild switch --flake .#<profile>
- Validate the flake
  - nix flake check
- Format Nix files (nixfmt-rfc-style is included)
  - find . -name "*.nix" -print0 | xargs -0 nixfmt
- Host management
  - zcli update-host [hostname] [profile]   # edits flake.nix host/profile
  - zcli add-host <hostname> [profile]      # copies hosts/default and guides hardware.nix
- Diagnostics and maintenance
  - zcli diag        # writes ~/diag.txt
  - zcli cleanup     # prunes older generations (prompts for retention)

zcli advanced options (for rebuild/update)
- --dry (-n)    preview only
- --ask (-a)    confirm before proceeding
- --cores N     cap build CPU usage
- --verbose (-v) more logs
- --no-nom      disable nix-output-monitor

Profiles and when to use them
- amd, intel, nvidia, nvidia-laptop (intel+NVIDIA hybrid), amd-hybrid (AMD+NVIDIA hybrid), vm
- Choose with the <profile> argument in nh/nixos-rebuild commands (e.g., .#vm)

High-level architecture
- flake.nix
  - Inputs: nixpkgs 25.05, home-manager 25.05, stylix, nvf, nix-flatpak
  - Local constants: system, host, profile, username
  - nixosConfigurations: one per GPU/VM profile via mkNixosConfig
    - Each configuration imports profiles/<profile>
- profiles/<profile>/default.nix
  - Imports the active host and the system module stacks:
    - ../../hosts/${host}
    - ../../modules/drivers
    - ../../modules/core
  - Flips toggles: drivers.*.enable and vm.guest-services.enable
  - Hybrid laptops: profiles/nvidia-laptop pulls intel/nvidia Bus IDs from the host’s variables.nix and wires nvidia-prime; profiles/amd-hybrid pulls amdgpu/nvidia Bus IDs and wires the AMD+NVIDIA offload module
- hosts/<hostname>/
  - default.nix imports hardware.nix and host-packages.nix
  - variables.nix is the control panel for UX + feature toggles:
    - displayManager (greetd vs sddm)
    - terminal/browser defaults (enable per-terminal via flags)
    - waybarChoice, animChoice, stylixImage
    - 24h clock, thunarEnable, printEnable, NFS
    - intelID/nvidiaID for Prime offload
- modules/core
  - default.nix composes focused NixOS modules: boot, flatpak, fonts, hardware, network, nfs, nh, packages, printing, display manager (conditional greetd/sddm), security, services (PipeWire, SSH, Bluetooth, fstrim; smartd conditional on profile), steam, stylix, syncthing, system (nix settings, locales, env vars), thunar, user (Home Manager), virtualisation, xserver
  - user.nix integrates Home Manager and creates users.${username}; passes extraSpecialArgs { inputs, username, host, profile } to the home layer
  - nh.nix enables nh, configures GC, and pins programs.nh.flake = /home/${username}/zaneyos
- modules/drivers
  - Aggregates AMD, Intel, NVIDIA, NVIDIA Prime, and VM guest services
  - nvidia-prime-drivers.nix exposes options.drivers.nvidia-prime.{enable,intelBusID,nvidiaBusID} consumed by the nvidia-laptop profile; nvidia-amd-hybrid.nix exposes options.drivers.nvidia-amd-hybrid.{enable,amdgpuBusID,nvidiaBusID} consumed by the amd-hybrid profile
  - vm-guest-services.nix enables qemu-guest, spice agents when vm.guest-services.enable = true
- modules/home
  - default.nix composes the user environment (Hyprland, Waybar via waybarChoice, Rofi, Yazi, Kitty/WezTerm/Ghostty/Alacritty toggles, Zsh/Bash config, Git, NVF/Neovim, OBS, swaync, scripts, Stylix, optional Doom Emacs/VSCodium/Helix)
  - scripts/default.nix installs user-space tools including zcli; zcli wraps rebuild/update/boot builds, cleanup, diagnostics, host management, and Doom Emacs lifecycle

Where to change what
- flake.nix: set username, host, profile; add inputs; wire outputs
- hosts/<hostname>/{variables.nix,hardware.nix,host-packages.nix}: per-machine behavior, theming, and hardware
- modules/core/*: system-level settings, services, packages
- modules/home/*: user apps, shell, window manager, UI

Common workflows
- Small UX tweaks: edit hosts/<hostname>/variables.nix → fr
- Theme swap: edit stylixImage/waybarChoice in variables.nix → fr (or zcli rebuild-boot)
- GPU/VM switch: choose nixos-rebuild/nh profile (e.g., nh os switch --hostname vm) and optionally update host/profile constants with zcli update-host

Validation and troubleshooting
- nix flake check for a quick sanity test
- zcli diag to produce a detailed hardware/system report
- If the repo is not under ~/zaneyos, update modules/core/nh.nix so zcli/nh operate on the correct path

Documentation pointers
- README.md: requirements, first-time install methods, upgrade overview
- zcli.md: full CLI documentation, commands, options, and examples
- cheatsheets/: quick-reference guides for Hyprland, terminals, editors, etc.

