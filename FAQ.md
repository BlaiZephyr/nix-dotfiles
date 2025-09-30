[English](FAQ.md) | [Español](FAQ.es.md)

# 💬 ZaneyOS FAQ for v2.4

- **Revision v1.26**
- **Date:** 01-September-2025

> IMPORTANT: Upgrading from v2.3 to v2.4?
> - Strongly recommended: Read `ZaneyOS-Upgrade.md` fully before attempting the upgrade.
> - It explains the automated upgrade, full backup, host migration, and revert process.
> - Do NOT use the `fu` or `fr` aliases for this upgrade.
> - If you've made extensive modifications, do not run the script—review the docs and migrate manually.

**⌨ Where can I see the Hyprland keybindings?**

- The SUPER key + K opens a searchable menu with the bindings
- The "keys" icon on the right side of the waybar will also bring up this menu.

<details>
<summary>**✨🖥️  ZCLI:  What is it and how do I use it?**</summary>
<div style="margin-left: 20px;">

The `zcli` utility is a command-line tool designed to simplify the management of
your `zaneyos` environment. It provides a comprehensive set of commands to perform common
tasks such as updating your system, managing hosts, cleaning up old generations,
and managing Doom Emacs.

To use it, open a terminal and type `zcli` followed by one of the commands
listed below:

## Core System Commands:
- `cleanup`: Clean up old system generations. You can specify the number of generations to keep. Includes automated log cleanup for old build logs.
- `diag`: Create a comprehensive system diagnostic report using `inxi --full`, saved to `~/diag.txt`. Perfect for troubleshooting.
- `list-gens`: List both user and system generations with detailed information.
- `rebuild`: Rebuild the NixOS system configuration with enhanced safety checks and backup file handling.
- `rebuild-boot`: Rebuild and set as boot default (activates on next restart). Safer for major system changes and kernel updates.
- `trim`: Trim filesystems to improve SSD performance with user confirmation prompts.
- `update`: Update the flake and rebuild the system with comprehensive error handling.

## Host Management:
- `update-host`: Automatically set the host and profile in `flake.nix`. Features intelligent GPU detection and hostname validation.
- `add-host`: Create new host configurations with automated GPU detection, hardware.nix generation, and git integration.
- `del-host`: Safely delete host configurations with confirmation prompts to prevent accidental removal.

**Usage:** `zcli add-host [hostname] [profile]`  
**GPU Profiles:** `amd`, `intel`, `nvidia`, `nvidia-hybrid`, and `vm`

## Advanced Build Options:
The `rebuild`, `rebuild-boot`, and `update` commands support enhanced options for fine-grained control:
- `--dry, -n`: Preview mode - shows what would be done without executing (dry run)
- `--ask, -a`: Interactive confirmation prompts for safety-critical operations
- `--cores N`: Limit build operations to N CPU cores (essential for VMs and resource-constrained systems)
- `--verbose, -v`: Enable detailed operation logs and verbose output for troubleshooting
- `--no-nom`: Disable nix-output-monitor for traditional command-line output

**Multiple options can be combined** for precise control over your build process.

## Doom Emacs Management:
Complete Doom Emacs lifecycle management with safety features:
- `doom install`: Automated Doom Emacs installation using the get-doom script with all required packages
- `doom status`: Check installation status and display version information for verification
- `doom remove`: Safely remove Doom Emacs installation with confirmation prompts to prevent accidental deletion
- `doom update`: Update Doom Emacs packages and configuration via `doom sync`

**Features:** Built-in safety checks, comprehensive error handling, and automatic dependency management.

```text
❯ zcli
Error: No command provided.
ZaneyOS CLI Utility -- version 1.0.2

Usage: zcli [command] [options]

Commands:
  cleanup         - Clean up old system generations. Can specify a number to keep.
  diag            - Create a system diagnostic report.
                    (Filename: homedir/diag.txt)
  list-gens       - List user and system generations.
  rebuild         - Rebuild the NixOS system configuration.
  rebuild-boot    - Rebuild and set as boot default (activates on next restart).
  trim            - Trim filesystems to improve SSD performance.
  update          - Update the flake and rebuild the system.
  update-host     - Auto set host and profile in flake.nix.
                    (Opt: zcli update-host [hostname] [profile])

Options for rebuild, rebuild-boot, and update commands:
  --dry, -n       - Show what would be done without doing it
  --ask, -a       - Ask for confirmation before proceeding
  --cores N       - Limit build to N cores (useful for VMs)
  --verbose, -v   - Show verbose output
  --no-nom        - Don't use nix-output-monitor

Doom Emacs:
  doom install    - Install Doom Emacs using get-doom script.
  doom status     - Check if Doom Emacs is installed.
  doom remove     - Remove Doom Emacs installation.
  doom update     - Update Doom Emacs (runs doom sync).

  help            - Show this help message.
```

**Examples:**
```bash
# System management
zcli rebuild --dry                # Show what would be rebuilt
zcli update --cores 4             # Update with 4 CPU cores max
zcli rebuild-boot --ask           # Rebuild for boot with confirmation

# Host management
zcli add-host myhost amd          # Add new host with AMD GPU
zcli update-host                  # Auto-detect and update host info

# Doom Emacs
zcli doom install                 # Install Doom Emacs
zcli doom status                  # Check installation status
```

</div>
</details>

## Major Hyprland Keybindings

Below are the keybindings for Hyprland, formatted for easy reference.

## Application Launching

- `$modifier + Return` → Launch `Terminal`
- `$modifier + K` → List keybinds
- `$modifier + Shift + Return` → Launch `rofi-launcher`
- `$modifier + Shift + W` → Open `web-search`
- `$modifier + Alt + W` → Open `wallsetter`
- `$modifier + Shift + N` → Run `swaync-client -rs`
- `$modifier + W` → Launch `Web Browser`
- `$modifier + Y` → Open `kitty` with `yazi`
- `$modifier + E` → Open `emopicker9000`
- `$modifier + S` → Take a screenshot
- `$modifier + D` → Open `Discord`
- `$modifier + O` → Launch `OBS Studio`
- `$modifier + C` → Run `hyprpicker -a`
- `$modifier + G` → Open `GIMP`
- `$modifier + V` → Show clipboard history via `cliphist`
- `$modifier + T` → Toggle terminal with `pypr`
- `$modifier + M` → Open `pavucontrol`

## Window Management

- `$modifier + Q` → Kill active window
- `$modifier + P` → Toggle pseudo tiling
- `$modifier + Shift + I` → Toggle split mode
- `$modifier + F` → Toggle fullscreen
- `$modifier + Shift + F` → Toggle floating mode
- `$modifier + Alt + F` → Float all windows
- `$modifier + Shift + C` → Exit Hyprland

## Window Movement

- `$modifier + Shift + ← / → / ↑ / ↓` → Move window left/right/up/down
- `$modifier + Shift + H / L / K / J` → Move window left/right/up/down
- `$modifier + Alt + ← / → / ↑ / ↓` → Swap window left/right/up/down
- `$modifier + Alt + 43 / 46 / 45 / 44` → Swap window left/right/up/down

## Focus Movement

- `$modifier + ← / → / ↑ / ↓` → Move focus left/right/up/down
- `$modifier + H / L / K / J` → Move focus left/right/up/down

## Workspaces

- `$modifier + 1-10` → Switch to workspace 1-10
- `$modifier + Shift + Space` → Move window to special workspace
- `$modifier + Space` → Toggle special workspace
- `$modifier + Shift + 1-10` → Move window to workspace 1-10
- `$modifier + Control + → / ←` → Switch workspace forward/backward

## Window Cycling

- `Alt + Tab` → Cycle to next window
- `Alt + Tab` → Bring active window to top

## Questions, settings, updating, misc...

<details>

<summary>**❄ Why did you create ZaneyOS ? **</summary>

<div style="margin-left: 20px;">

- In the beginning, it was simply my configuration saved on a GIT repository.
- It was there to promote NixOS and Hyprland.
- Providing a stable, working configuration.
- It has never been intended as a full NixOS distro.
- The `ZaneyOS` name is an inside joke among friends.
- The intent is this configration can be used as a daily driver
- Develop software, play games via steam, etc.
- My hope is that it helpful, and will modify it to fit your needs.
- That is the key take away. Make it your own.
- You create a fork of ZaneyOS, then modify it.
- If you find an issue and fix it, or provide a new feature, please share it.
- ZaneyOS is not a distro. At this time there are no plans to create an install
  ISO.

</div>
</details>

<details>
<summary>**🖼️ Settings and configuration**</summary>

<div style="margin-left: 20px;">

<details>
<summary>**How to I add flatpaks? ?**</summary>

- Edit `~/zaneyos/modules/core/flatpak.nix`
- There is a list of sample apps you can use as a template

```nix
 services = {
    flatpak = {
      enable = true;

      # List the Flatpak applications you want to install
      # Use the official Flatpak application ID (e.g., from flathub.org)
      # Examples:
      packages = [
        #"com.github.tchx84.Flatseal" #Manage flatpak permissions - should always have this
        #"com.rtosta.zapzap"              # WhatsApp client
        #"io.github.flattool.Warehouse"   # Manage flatpaks, clean data, remove flatpaks and deps
        #"it.mijorus.gearlever"           # Manage and support AppImages
        #"io.github.freedoom.Phase1"      #  Classic Doom FPS 1
        #"io.github.freedoom.Phase2"      #  Classic Doom FPS 2
        #"io.github.dvlv.boxbuddyrs"      #  Manage distroboxes

        # Add other Flatpak IDs here, e.g., "org.mozilla.firefox"
      ];

      # Optional: Automatically update Flatpaks when you run nixos-rebuild swit ch
      update.onActivation = true;
    };
  };
```

- Make sure you use the correct package name
- Go to `flathub.org`to verify or use `flatpak search PACKAGENAME`
- Save the file and to a rebuild with the `fr`alias
- After you can run `flatpak list` to verify the install
- When you run `fu` or `fr` the flatpaks will get updated as well

</details>

<details>
<summary>**How to I remove flatpaks? ?**</summary>

- Edit `~/zaneyos/modules/core/flatpak.nix`

```nix
 services = {
    flatpak = {
      enable = true;

      # List the Flatpak applications you want to install
      # Use the official Flatpak application ID (e.g., from flathub.org)
      # Examples:
      packages = [
        #"com.github.tchx84.Flatseal" #Manage flatpak permissions - should always have this
        #"com.rtosta.zapzap"              # WhatsApp client
        #"io.github.flattool.Warehouse"   # Manage flatpaks, clean data, remove flatpaks and deps
        #"it.mijorus.gearlever"           # Manage and support AppImages
        #"io.github.freedoom.Phase1"      #  Classic Doom FPS 1
        #"io.github.freedoom.Phase2"      #  Classic Doom FPS 2
        #"io.github.dvlv.boxbuddyrs"      #  Manage distroboxes

        # Add other Flatpak IDs here, e.g., "org.mozilla.firefox"
      ];

      # Optional: Automatically update Flatpaks when you run nixos-rebuild swit ch
      update.onActivation = true;
    };
  };
```

- Either remove the line with the package you want to remove or comment it out
- Save the file and to a rebuild with the `fr`alias
- After you can run `flatpak list` to verify the package(s) are removed
- Note the base dependencies for flatpaks remain once installed.

</details>

<details>
<summary>**How to I change the waybar?**</summary>

- Go to the `~/zaneyos/host/HOSTNAME`
- Edit the `variables.nix` file
- Find the line that starts `waybarChoice`
- Change the name to one of the available files
- `waybar-simple.nix`, `waybar-curved.nix`, or `waybar-ddubs.nix`
- Save the file and exit
- You need to do a rebuild to make the change effective
- Run `fr` "flake rebuild" to start the rebuild process

```json
# Set Waybar
# Includes alternates such as waybar-simple.nix, waybar-curved.nix & waybar-ddubs.nix
waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;
```

</details>

<details>
<summary>** How do I change the Timezone? **</summary>

1. In the file, `~/zaneyos/modules/core/system.nix`
2. Edit the line: time.timeZone = "America/New_York";
3. Save the file and rebuild using the `fr` alias.

</details>

<details>
<summary>**How do I change the monitor settings? **</summary>

Monitor settings are in the file: `~/zaneyos/hosts/<HOSTNAME>/variables.nix`

Inside the quotes the syntax is "monitor=video apapter,resolution@refresh rate,
auto,scale" Monitor must be in all lowercase. If you are not sure of your video
devices run `hyprctl monitors` at a terminal CLI. The output will look similar
to this:

```text
hyprctl monitors
Monitor HDMI-A-1 (ID 0):
	2560x1440@143.91200 at 0x0
	description: Dell Inc. DELL S3222DGM F45WJK3
	make: Dell Inc.
	model: DELL S3222DGM
	serial: F45WJK3
	active workspace: 1 (1)
	special workspace: 0 ()
	reserved: 0 52 0 0
	scale: 1.00
	transform: 0
	focused: yes
	dpmsStatus: 1
	vrr: false
	solitary: 0
	activelyTearing: false
	directScanoutTo: 0
	disabled: false
	currentFormat: XRGB8888
	mirrorOf: none
	availableModes: 2560x1440@59.95Hz 2560x1440@143.91Hz 2560x1440@120.00Hz 1920x1200@59.95Hz 1920x1080@143.86Hz 1920x1080@120.00Hz 1920x1080@119.88Hz 1920x1080@60.00Hz 1920x1080@60.00Hz 1920x1080@59.94Hz 1920x1080@50.00Hz 1600x1200@60.00Hz 1680x1050@59.88Hz 1280x1024@75.03Hz 1280x1024@60.02Hz 1440x900@59.95Hz 1280x800@59.91Hz 1152x864@75.00Hz 1280x720@120.00Hz 1280x720@119.88Hz 1280x720@60.00Hz 1280x720@59.94Hz 1280x720@50.00Hz 1024x768@75.03Hz 1024x768@60.00Hz 800x600@75.00Hz 800x600@60.32Hz 720x576@50.00Hz 720x576@50.00Hz 720x480@60.00Hz 720x480@60.00Hz 720x480@59.94Hz 720x480@59.94Hz 640x480@75.00Hz 640x480@60.00Hz 640x480@59.94Hz 640x480@59.94Hz 720x400@70.08Hz
```

Edit the `extraMonitorSettings` line. **Examples:**

- Single Monitor: `extraMonitorSettings = "monitor=eDP-1,1920x1080@60,auto,1";`
- Multiple Monitors:
  `extraMonitorSettings = "
            monitor=eDP-1,1920x1080@60,auto,auto
            monitor=HDMI-A-1,2560x1440@75,auto,auto
            ";`

- For more complex, multi-monitor configurations, you may wish to use the GUI
  application, `nwg-displays` This will show your currently connected monitors
  allowing you to use the mouse match how they are physicall arranged. E.g. what
  monitor is to the left, right, up or down. It is very similar to the X11 based
  tool, `arandr` It will then create a Hyprland compatible configuration file at
  `~/.config/hypr/monitors.conf`

<img align="center" width="90%" src="https://gitlab.com/Zaney/zaneyos/-/raw/main/img/nwg-displays.png" />

After you finish configring the monitors as you wish, hit `Apply` to save the
changes to `~/.config/hypr/monitors.conf`\
The contents will look something like this:

```text
# Generated by nwg-displays on 2025-03-20 at 13:13:49. Do not edit manually.
monitor=HDMI-A-1,1920x1080@74.97,2136x268,1.0
monitor=eDP-1,1920x1080@144.0,216x268,1.0
```

You only need to copy the `monitor=` lines and paste them into the
`variables.nix` file as described in the process above.

Once you have that done. Run the command alias `fr` to build a new generation to
make the chnages effective.

More information on configuring monitors is available on the
[Hyprland Wiki](https://wiki.hyprland.org/Configuring/Monitors/)

</details>

<details>
<summary>**How do I add applications to ZaneyOS? **</summary>

### There are two options. One for all hosts you have, another for a specific host.

1. For applications to be included in all defined hosts edit the
   `~/zaneyos/modules/core/packages.nix` file.

There is a section that begins with: `environment.systemPackages = with pkgs;`

Followed by a list of packages These are required for ZaneyOS.

We suggest you add a comment at the end of the package names. Then add in your
packages.

```text
    ...
    virt-viewer
    wget
    ###  My Apps ### 
    bottom
    dua
    emacs-nox
    fd
    gping
    lazygit
    lunarvim
    luarocks
    mission-center
    ncdu
    nvtopPackages.full
    oh-my-posh
    pyprland
    shellcheck
    multimarkdown
    nodejs_23
    ugrep
    zoxide
  ];
}
```

2. For applications that will only be on specific host.

You edit the `host-packages.nix` associated with that host.
`~/zaneyos/hosts/<HOSTNAME>/host-packages.nix`

The part of the file you need to edit, looks like this:

```nix
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    obs-studio
  ];
}
```

You can add additional packages, or for example change `discord` to
`discord-canary` to get the beta version of Discord but only on this host.

</details>

<details>

<summary>** I added the package names, now how do I install them ? **</summary>

- Use the `zcli` utility. `zcli rebuild`
- The legacy `fr`, Flake Rebuild alias, is depreciated but still available

If the rebuild completes successfully, a new generation with your added packages
will be created.

</details>

<details>
<summary>** How do I update the packages I've already installed? **</summary>

- Use the `zcli` utility. `zcli update`
- The `fu`, Flake Update alias, is depreciated but still available
- Either of these will check for updated packages, download and install them.

</details>

<details>
<summary>** I made a change to my ZaneyOS configuration, how do I activate it? **</summary>

- Use the `zcli` utility. `zcli rebuild`
- The legacy `fr`, Flake Rebuild alias, is depreciated but still available **
  NOTE: If you **created a new file**
- you will need to run a `git add .` command in the `zaneyos` folder
- If successful a new generation will be generated with your changes
- A logout or reboot could be required depending on what you changed

</details>

<details>
<summary>** How can I configure a different kernel on a specific host? **</summary>

1. You have to edit the `hardware.nix` file for that host in
   `~/zaneyos/hosts/HOSTNAME/hardware.nix` and override the default.
2. Near the top you will find this section of the `hardware.nix` file.

```nix
boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_usb_sdmmc"];
boot.initrd.kernelModules = [];
boot.kernelModules = ["kvm-intel"];
boot.extraModulePackages = [];
```

3. Add the override. E.g. to set the kernel to 6.12.

- `boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_12;`

4. The updated code should look like this:

```nix
boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_usb_sdmmc"];
boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_12;
boot.initrd.kernelModules = [];
boot.kernelModules = ["kvm-intel"];
boot.extraModulePackages = [];
```

5. Use the command `zcli rebuild` or alias `fr` to create a new generation and
   reboot to take effect.

</details>

<details>

<summary>** What are the major Kernel options in NixOS? **</summary>
NixOS offers several major kernel types to cater to different needs and preferences. Below are the available options, excluding specific kernel versions:

1. **`linuxPackages`**
   - The default stable kernel, typically an LTS (Long-Term Support) version.
     LTS in 25.05 (warbler) is 6.12.x Older kernels, 6.6.x, 6.8.x are not
     supported.

2. **`linuxPackages_latest`**
   - The latest mainline kernel, which may include newer features but could be
     less stable.

3. **`linuxPackages_zen`**
   - A performance-optimized kernel with patches aimed at improving
     responsiveness and interactivity. Commonly used by gamers and desktop
     users.

4. **`linuxPackages_hardened`**
   - A security-focused kernel with additional hardening patches for enhanced
     protection.

5. **`linuxPackages_rt`**
   - A real-time kernel designed for low-latency and time-sensitive
     applications, such as audio production or robotics.

6. **`linuxPackages_libre`**
   - A kernel stripped of proprietary firmware and drivers, adhering to free
     software principles.

7. **`linuxPackages_xen_dom0`**
   - A kernel tailored for running as the host (dom0) in Xen virtualization
     environments.

8. **`linuxPackages_mptcp`**
   - A kernel with support for Multipath TCP, useful for advanced networking
     scenarios.

</details>

<details>

<summary>**  I have older generations I want to delete, how can I do that? **</summary>

- The `ncg` NixOS Clean Generations alias will remove **ALL** but the most
  current generation. Make sure you have booted from that generation before
  using this alias. There is also a schedule that will remove older generations
  automatically over time.

</details>

<details>

<summary>**How do I change the hostname? **</summary>

To change the hostname, there are several steps and you will have to reboot to
make the change effective.

1. Copy the directory of the host you want to rename to a directory with the new
   name.

- `cp -rpv ~/zaneyos/hosts/OLD-HOSTNAME ~/zaneyos/hosts/NEW-HOSTNAME`

2. Edit the `~/zaneyos/flake.nix` file. Change the line:

- `host = "NEW-HOSTNAME"`

3. In the `~/zaneyos` Directory run `git add .` _The rebuild will fail with a
   'file not found' error if you forget this step._

4. Use the `zcli rebuild` or fr` alias to create a new generation with the new
   hostname. You must reboot to make the change effective.

</details>
<details>
<summary>** How do I disable the spinning snowflake at startup? **</summary>

1. Edit the `~/zaneyos/modules/core/boot.nix` file.
2. Look for:

```nix
};
 plymouth.enable = true;
};
```

3. Change it to `false`
4. Run the command `zcli rebuild` or use alias `fr` to create a new generation.

</details>

<details>
 <summary>** How do I configure my hybrid laptop with Intel/NVIDIA GPUs?  **</summary>

1. Either run the `install-zaneyos.sh` script and select `nvidia-laptop`
   template or if configuring manually, set the template in the `flake.nix` to
   `nvidia-prime`

2. In the `~/zaneyos/hosts/HYBRID-HOST/variables.nix` file you will need to set
   the PCI IDs for the Intel and NVIDIA GPUs. Refer to
   [this page](https://nixos.wiki/wiki/Nvidia) to help determine those values.

3. Once you have everything configured properly, use the `fr` Flake Rebuild
   alias to create a new generation.

4. In the `~/zaneyos/modules/home/hyprland/config.nix` file is an ENV
   setting`"AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1:/dev/dri/card2"` This
   sets the primary and secondary GPUs. Using the info from the weblink above
   you might have to change the order of these values.

</details>

</div>

</details>

<details>
<summary>**🎨 Stylix**</summary>

<div style="margin-left: 20px;">

<details>
<summary>How do I enable or disable Stylix? </summary>

- To Enable:

1. Edit the `~/zaneyos/modules/core/stylix.nix` file.
2. Comment out from `base16Scheme` to the `};` after `base0F`

```nix
# Styling Options
  stylix = {
    enable = true;
    image = ../../wallpapers/Anime-girl-sitting-night-sky_1952x1120.jpg;
    #image = ../../wallpapers/Rainnight.jpg;
    #image = ../../wallpapers/zaney-wallpaper.jpg;
    #  base16Scheme = {
    #  base00 = "282936";
    #  base01 = "3a3c4e";
    #  base02 = "4d4f68";
    #  base03 = "626483";
    #  base04 = "62d6e8";
    #  base05 = "e9e9f4";
    #  base06 = "f1f2f8";
    #  base07 = "f7f7fb";
    #  base08 = "ea51b2";
    #  base09 = "b45bcf";
    #  base0A = "00f769";
    #  base0B = "ebff87";
    #  base0C = "a1efe4";
    #  base0D = "62d6e8";
    #  base0E = "b45bcf";
    #  base0F = "00f769";
    #};
    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
```

3. Select the image you want `stylix` to use for the colorpalette.
4. Run `zcli rebuild` command or `fr` alias to create a new generation with this
   colorscheme.

- To disable uncomment

1. Edit the `~/zaneyos/modules/core/stylix.nix` file.
2. Uncomment out from `base16Scheme` to the `};` after `base0F`

```nix
 base16Scheme = {
  base00 = "282936";
  base01 = "3a3c4e";
  base02 = "4d4f68";
  base03 = "626483";
  base04 = "62d6e8";
  base05 = "e9e9f4";
  base06 = "f1f2f8";
  base07 = "f7f7fb";
  base08 = "ea51b2";
  base09 = "b45bcf";
  base0A = "00f769";
  base0B = "ebff87";
  base0C = "a1efe4";
  base0D = "62d6e8";
  base0E = "b45bcf";
  base0F = "00f769";
};
```

3. Run the `zcli rebuild` command or `fr` alias to build a new generation with
   either the default dracula or set your own custom colors

</details>

<details>
 <summary>How do I change the image Stylix uses to theme with?</summary>

1. Edit the `~/zaneyos/hosts/HOSTNAME/varibles.nix`
2. Change the `stylixImage =` to the filename you want to use. Wallpapers are in
   `~/zaneyos/wallpapers`

```nix
# Set Stylix Image
stylixImage = ../../wallpapers/AnimeGirlNightSky.jpg;
```

</details>

</div>

</details>

<details>
<summary>**🌃 Wallpapers**</summary>

<div style="margin-left: 20px;">

<details>
<summary>**  How do I add more wallpapers? **</summary>

- Wallpapers are stored in the `~/zaneyos/wallpapers` directory.
- Simply copy the new ones to that diretory.
- You must do a rebuild after adding new wallpapers.
- Run `zcli rebuild` command `fr` alias at the CLI.

</details>

<details>

<summary>** How do I change the background? **</summary>

- SUPER + ALT + W will select a new background

</details>

<details>

<summary>**  How can I set a timer to change the wallpaper automatically?  **</summary>

1. Edit the `~/zaneyos/modules/home/hyprland/config.nix` file.
2. Comment out the line `sleep 1.5 && swww img ...`
3. Add new line after that with `sleep 1 && wallsetter`

```json
settings = {
     exec-once = [
       "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
       "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
       "killall -q swww;sleep .5 && swww init"
       "killall -q waybar;sleep .5 && waybar"
       "killall -q swaync;sleep .5 && swaync"
       "nm-applet --indicator"
       "lxqt-policykit-agent"
       "pypr &"
       #"sleep 1.5 && swww img /home/${username}/Pictures/Wallpapers/zaney-wallpaper.jpg"
       "sleep 1 && wallsetter"
     ];
```

4. Run the `zcli rebuild` command or `fr` alias to create a new generation.
5. You will need to logout or reboot to make the change effective.

</details>

<details>

<summary>**How do I change the interval the wallpaper changes?  **</summary>

1. Edit the `~/zaneyos/modules/home/scripts/wallsetter`
2. Change the `TIMEOUT =` value. Which is in seconds.
3. Run the `zcli` command or`fr` alias, to create a new generation.
4. You will need to logout or reboot to make the change effective.

</details>

</div>

</details>

<details>
<summary>**⬆ How do I update ZaneyOS?  **</summary>

<div style="margin-left: 20px;">

<details>
<summary> For version v2.3 </summary>

Strongly recommended: Read `ZaneyOS-Upgrade.md` before proceeding. It details the safe, automated upgrade, backup, and revert process.

Use the automated v2.3 → v2.4 upgrade. See `ZaneyOS-Upgrade.md` and `UPGRADE-2.3-to-2.4.md`. To avoid overwriting your config before a backup is created, fetch just the script without modifying your working tree:

- Git (recommended):
```bash
git -C ~/zaneyos fetch origin
git -C ~/zaneyos show origin/main:upgrade-2.3-to-2.4.sh > ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```
- Curl:
```bash
curl -fsSL https://gitlab.com/zaney/zaneyos/-/raw/main/upgrade-2.3-to-2.4.sh -o ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```
Then run the script: `~/upgrade-2.3-to-2.4.sh`. It will create a full backup before switching branches and migrate your hosts safely from the backup.

**IMPORTANT:**
- Do NOT use the `fu` or `fr` aliases for this upgrade; the script uses a safe boot build.
- If you have made extensive modifications, do not run the script. Read the docs above and migrate manually instead.

</details>

<details>
 <summary> For versions v2.0->2.2 </summary>

1. First backup your existing `zaneyos` directory. e.g.
   `cp -r ~/zaneyos ~/zaneyos-backup`

2. There is no direct update. When you clone the the new config the config files
   and layout have changed.

3. You need to install zaneyos like a new install. `./install-zaneyos.sh`

4. Once the build completes and you have rebooted you can review the new layout
   and decide what if any changes you made on the earlier version can be
   migrated to v2.3.

</details>

<details>
 <summary> For version v1.x </summary>

1. The layout and configuration are completely different. Virtually noting from
   1.x is applicable to v2.3.

2. Backup your `zaneyos` directory e.g. `cp -r ~/zaneyos ~/zaneyos-backup`

3. Run the `./install-zaneyos.sh` script and follow the new install
   instructions.

</details>

<details>
<summary> How do I know when a new version of ZaneyOS is released? </summary>

It will be announced on the Zaney [Discord](https://discord.gg/W7efsSDS) server.

</details>

</div>

</details>

</xxx>

<details><summary>**📂 ZaneyOS v2.3 Layout**</summary>

<div style="margin-left: 25px;">

** 📂 ~/zaneyos **

```text
~/zaneyos/
    ├── hosts/                      # Folder where host configs are saved
    │   ├── default                 # Default host template
    │   └── nixstation              # Zaney's host 
    ├── img/                        # Images for README.md
    ├── modules/                    # Core, HomeMgr, drivers config files
    │   └── drivers/                # AMD,NVIDA,Intel,VM config files
    │   └── core/                   # Services, packages, fonts, etc
    │   └── home/                   # Home Manager config files
    │    ├── fastfetch/             # Fastfetch config 
    │    ├── hyprland/              # Hyrprland configs
    │    ├── rofi/                  # rofi menu configs
    │    ├── scripts/               # screenshots, wallpaper, etc.
    │    ├── waybar/                # waybar configs in NIX format
    │    ├── wlogout/               # Theme, config for logout menu
    │    ├── yazi/                  # TUI filemgr config file
    │    └── zsh/                   # Theme and settings for ZSH
    ├── profiles/                   # Video hardware templates
    │    ├── amd/                   # AMD Video config files
    │    ├── intel/                 # Intel video config files
    │    ├── nvidia/                # NVIDIA discrete video config files
    │    ├── nvidia-laptop/         # NVIDIA Hybrid video config files
    │    └── vm/                    # Virtual Machine config files
    ├── wallpapers/                 # Add your wallpapers here 
    ├── CHANGELOG.md                # List of changes
    ├── CONTRIBUTING.md             # How you can help 
    ├── FAQ.md                      # Frequently Asked Questions
    ├── flake.lock                  # Saves version info on all installed packages
    ├── flake.nix                   # flake that controls ZaneyOS config
    ├── install-zaneyos.sh          # Install script for ZaneyOS
    ├── LICENSE                     # MIT license ZaneyOS is using
    └── README.md                   # Intro document for ZaneyOS
```

</div>

</details>

**---> 🧰 Miscellaneous**

<details>

<summary>**🪧 Rebuild or update fails with Home Manager error can't backup a file**</summary>

<div style="margin-left: 20px;">
<br>

**Update**
<br>

- Using the `zcli rebuild` or `zcli update` will search for this file causing
  rebuild failures
- If you find other files that cause this you can add them in the
  `zaneyos/modules/home/scripts/default.nix`
  <br>

```text
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: Please do one of the following:
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: - Move or remove the above files and try again.
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: - In standalone mode, use 'home-manager switch -b backup' to back up
May 08 18:33:57 explorer hm-activate-dwilliams[92420]:   files automatically.
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: - When used as a NixOS or nix-darwin module, set
May 08 18:33:57 explorer hm-activate-dwilliams[92420]:     'home-manager.backupFileExtension'
May 08 18:33:57 explorer hm-activate-dwilliams[92420]:   to, for example, 'backup' and rebuild.
May 08 18:33:57 explorer systemd[1]: home-manager-dwilliams.service: Main process exited, code=exited, status=1/FAILURE
May 08 18:33:57 explorer systemd[1]: home-manager-dwilliams.service: Failed with result 'exit-code'.
May 08 18:33:57 explorer systemd[1]: Failed to start Home Manager environment for dwilliams.
```

- There is a script `hm-find` That will search the journal and if found,
- It will prompt you to delete these backups
- It creates a log as well
- Note: The script is not perfect
- If you get this msg but `hm-find` doesn't report any you will have to search
  manually e.g `journalctl | grep hm-activate`
- You can now redo your rebuild
- Use the `zcli rebuild` or `fr` alias
- If you ran `fu` for `flake update` you can now do `zcli rebuild` or `fr` for
  `flake rebuild`
- The flake has already been updated

</div>
</details>

<details>

<summary>**📚 What is the difference between Master and Dwindle layouts**</summary>

<div style="margin-left: 20px;">
<br>

**1. Master Layout**

- The **Master** layout divides the workspace into two main areas:
  - A **master area** for the primary window, which takes up a larger portion of
    the screen.
  - A **stack area** for all other windows, which are tiled in the remaining
    space.
- This layout is ideal for workflows where you want to focus on a single main
  window while keeping others accessible.

**2. Dwindle Layout**

- The **Dwindle** layout is a binary tree-based tiling layout:
  - Each new window splits the available space dynamically, alternating between
    horizontal and vertical splits.
  - The splits are determined by the aspect ratio of the parent container (e.g.,
    wider splits horizontally, taller splits vertically).
- This layout is more dynamic and evenly distributes space among all windows.

---

**How to Verify the Current Layout**

To check which layout is currently active, use the `hyprctl` command:

`hyprctl getoption general:layout`

</details>
</div>

</details>

<details>
<summary>**📦 What are the Yazi keybindings and how can I change them? **</summary>

<div style="margin-left: 20px;"> <br>

The Yazi configuration file is located in `~/zaneyos/modules/home/yazi.nix`

Yazi is configured like VIM and VIM motions

The keymap is in the `~/zaneyos/modules/home/yazi/keymap.toml` file

</div>
</details>

<details>

<summary>** What fonts are avialable in NixOS**</summary>

```nix
{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      fira-code
      fira-code-symbols
      font-awesome
      hackgen-nf-font
      ibm-plex
      inter
      jetbrains-mono
      material-icons
      maple-mono.NF
      minecraftia
      nerd-fonts.im-writing
      nerd-fonts.blex-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-monochrome-emoji
      powerline-fonts
      roboto
      roboto-mono
      symbola
      terminus_font
      # NERD fonts 
      nerd-fonts.0xproto
      nerd-fonts._3270
      nerd-fonts.agave
      nerd-fonts.anonymice
      nerd-fonts.arimo
      nerd-fonts.aurulent-sans-mono
      nerd-fonts.bigblue-terminal
      nerd-fonts.bitstream-vera-sans-mono
      nerd-fonts.blex-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.caskaydia-mono
      nerd-fonts.code-new-roman
      nerd-fonts.comic-shanns-mono
      nerd-fonts.commit-mono
      nerd-fonts.cousine
      nerd-fonts.d2coding
      nerd-fonts.daddy-time-mono
      nerd-fonts.departure-mono
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.droid-sans-mono
      nerd-fonts.envy-code-r
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.geist-mono
      nerd-fonts.go-mono
      nerd-fonts.gohufont
      nerd-fonts.hack
      nerd-fonts.hasklug
      nerd-fonts.heavy-data
      nerd-fonts.hurmit
      nerd-fonts.im-writing
      nerd-fonts.inconsolata
      nerd-fonts.inconsolata-go
      nerd-fonts.inconsolata-lgc
      nerd-fonts.intone-mono
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      nerd-fonts.iosevka-term-slab
      nerd-fonts.jetbrains-mono
      nerd-fonts.lekton
      nerd-fonts.liberation
      nerd-fonts.lilex
      nerd-fonts.martian-mono
      nerd-fonts.meslo-lg
      nerd-fonts.monaspace
      nerd-fonts.monofur
      nerd-fonts.monoid
      nerd-fonts.mononoki
      nerd-fonts.mplus
      nerd-fonts.noto
      nerd-fonts.open-dyslexic
      nerd-fonts.overpass
      nerd-fonts.profont
      nerd-fonts.proggy-clean-tt
      nerd-fonts.recursive-mono
      nerd-fonts.roboto-mono
      nerd-fonts.shure-tech-mono
      nerd-fonts.sauce-code-pro
      nerd-fonts.space-mono
      nerd-fonts.symbols-only
      nerd-fonts.terminess-ttf
      nerd-fonts.tinos
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
      nerd-fonts.ubuntu-sans
      nerd-fonts.victor-mono
      nerd-fonts.zed-mono

    ];
  };
}
```

</details>

**---> 🖥️ Terminals **

<details>
<summary>**🐱  Kitty**</summary>

<details>

<summary>My cursor in Kitty is "janky" and it jumps around. How do I fix that?</summary>

- That feature is called "cursor_trail" in the
  `~/zaneyos/modules/home/kitty.nix` file.

1. Edit that file and change the `cursor_trail 1` to `cursor_trail 0` or comment
   out that line.
2. Use the command `zcli rebuild` or the alias `fr` to create a new generation
   with the change.

</details>

<details>
 <summary>What are the Kitty keybindings and how can I change them?</summary>

The kitty bindings are configured in `~/zaneyos/modules/home/kitty.nix`

The defaults are:

```text
    # Clipboard
    map ctrl+shift+v        paste_from_selection
    map shift+insert        paste_from_selection

    # Scrolling
    map ctrl+shift+up        scroll_line_up
    map ctrl+shift+down      scroll_line_down
    map ctrl+shift+k         scroll_line_up
    map ctrl+shift+j         scroll_line_down
    map ctrl+shift+page_up   scroll_page_up
    map ctrl+shift+page_down scroll_page_down
    map ctrl+shift+home      scroll_home
    map ctrl+shift+end       scroll_end
    map ctrl+shift+h         show_scrollback

    # Window management
    map alt+n               new_window_with_cwd      #Opens new window in current directory
    #map alt+n               new_os_window           #Opens new window in $HOME dir
    map alt+w               close_window
    map ctrl+shift+enter    launch --location=hsplit
    map ctrl+shift+s        launch --location=vsplit
    map ctrl+shift+]        next_window
    map ctrl+shift+[        previous_window
    map ctrl+shift+f        move_window_forward
    map ctrl+shift+b        move_window_backward
    map ctrl+shift+`        move_window_to_top
    map ctrl+shift+1        first_window
    map ctrl+shift+2        second_window
    map ctrl+shift+3        third_window
    map ctrl+shift+4        fourth_window
    map ctrl+shift+5        fifth_window
    map ctrl+shift+6        sixth_window
    map ctrl+shift+7        seventh_window
    map ctrl+shift+8        eighth_window
    map ctrl+shift+9        ninth_window
    map ctrl+shift+0        tenth_window

    # Tab management
    map ctrl+shift+right    next_tab
    map ctrl+shift+left     previous_tab
    map ctrl+shift+t        new_tab
    map ctrl+shift+q        close_tab
    map ctrl+shift+l        next_layout
    map ctrl+shift+.        move_tab_forward
    map ctrl+shift+,        move_tab_backward

    # Miscellaneous
    map ctrl+shift+up      increase_font_size
    map ctrl+shift+down    decrease_font_size
    map ctrl+shift+backspace restore_font_size
```

</details>
</details>

<details>

<summary>**🇼  WezTerm**</summary>

<div style="margin-left: 20px;">

<details>

<summary>How do I enable WezTerm?</summary>

Edit the `/zaneyos/modules/home/wezterm.nix` Change `enable = false` to
`enable = true;`\
Save the file and rebuild zaneyos with the `fr` command.

```
{pkgs, ...}: {
  programs.wezterm = {
    enable = false;
    package = pkgs.wezterm;
  };
```

</details>

<details>
 <summary>What are the WezTerm keybindings and how can I change them?</summary>

The kitty bindings are configured in `~/zaneyos/modules/home/wezterm.nix`

The defaults are:

```text
ALT is the defined META key for WezTerm
  -- Tab management
ALT + t                 Open new Tab
ALT + w                 Close current Tab
ALT + n                 Move to next Tab
ALT + p                 Move to previous Tab 
  -- Pane management
ALT + v                 Create Vertical Split
ALT + h                 Create Horizontal Split
ALT + q                 Close Current Pane
   -- Pane navigation (move between panes with ALT + Arrows)
ALT + Left Arrow        Move to pane -- Left
ALT + Right Arrow       Move to pane -- Right
ALT + Down Arrow        Move to pane -- Down
ALT + Up Arrow          Move to pane -- Down
```

</details>
</div>
</details>

<details>
<summary>**👻 Ghostty **</summary>

<div style="margin-left: 20px;">

<details>
<summary> How do I enable the ghostty terminal? </summary>

1. Edit the `~/zaneyos/modules/home/ghostty.nix` file.
2. Change `enable = true;`
3. Run the command alias `fr` to create a new generation.

</details>

<details>

<summary> How do I change the ghostty theme?   </summary>

1. Edit the `~/zaneyos/modules/home/ghostty.nix` file.
2. There are several example themes included but commented out.

```text
#theme = Aura
theme = Dracula
#theme = Aardvark Blue
#theme = GruvboxDarkHard
```

3. Comment out `Dracula` and either uncomment one of the others or add one of
   ghostty's many themes.

</details>

<details>
<summary> What are the default ghostty keybindings?  </summary>

```text
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
```

</details>
</div>
</details>

**
--> 🪧  General NixOS related topics
**

<details>
<summary>**❄  What are Flakes in NixOS? **</summary>

<div style="margin-left: 20px;">

**Flakes** are a feature of the Nix package manager that simplifies and
standardizes how configurations, dependencies, and packages are managed. If
you're familiar with tools like `package.json` in JavaScript or `Cargo.toml` in
Rust, flakes serve a similar purpose in the Nix ecosystem.

** Key Features of Flakes: **

1. **Pin Dependencies**:
   - Flakes lock the versions of dependencies in a `flake.lock` file, ensuring
     reproducibility across systems.

2. **Standardize Configurations**:
   - They use a `flake.nix` file to define how to build, run, or deploy a
     project or system, making setups more predictable.

3. **Improve Usability**:
   - Flakes simplify sharing and reusing configurations across different systems
     or projects by providing a consistent structure.

In essence, flakes help manage NixOS setups or Nix-based projects in a more
portable and reliable way.

</div>

</details>

<details>
<summary>**🏡  What is NixOS Home Manager? **</summary>

**Home Manager** is a powerful tool in the Nix ecosystem that allows you to
declaratively manage user-specific configurations and environments. With Home
Manager, you can streamline the setup of dotfiles, shell settings, applications,
and system packages for your user profile.

### Key Features of Home Manager:

1. **Declarative Configuration**:
   - Define all your settings and preferences in a single `home.nix` file,
     making it easy to track, share, and replicate your setup.

2. **Cross-Distribution Support**:
   - Home Manager works not only on NixOS but also on other Linux distributions
     and macOS, allowing you to standardize configurations across devices.

3. **User Environment Management**:
   - Manage applications, environment variables, shell configurations, and
     more—all isolated to your user profile.

### Why Use Home Manager?

Home Manager simplifies system management by offering consistency,
reproducibility, and portability. Whether you’re customizing your development
environment or sharing configurations between machines, it provides an efficient
way to tailor your user experience.

</details>

<details>
<summary>**🏭  What are Atomic Builds?**</summary>

**Atomic builds** in NixOS ensure that any system change (like installing
software or updating the configuration) is applied in a safe and fail-proof way.
This means that a system update is either fully successful or has no effect at
all, eliminating the risk of a partially applied or broken system state.

### How Atomic Builds Work:

1. **Immutable System Generation**:
   - Every configuration change creates a new "generation" of the system, while
     the previous ones remain untouched. You can easily roll back to an earlier
     generation if something goes wrong.

2. **Transaction-Like Behavior**:
   - Similar to database transactions, changes are applied atomically: either
     they succeed and become the new active system, or they fail and leave the
     current system unchanged.

3. **Seamless Rollbacks**:
   - In case of errors or issues, you can reboot and select a previous system
     generation from the boot menu to return to a working state.

### Benefits of Atomic Builds:

- **Reliability**: Your system is always in a consistent state, even if a
  configuration change fails.
- **Reproducibility**: The same configuration will always produce the same
  system state, making it easy to debug or replicate.
- **Ease of Rollback**: Reverting to a working configuration is as simple as
  rebooting and selecting the previous generation.

### Why NixOS Uses Atomic Builds:

This feature is a cornerstone of NixOS's declarative and reproducible design
philosophy, ensuring that system management is predictable and stress-free.

</details>

<details>
<summary>**❓ I am new to NIXOS where can I go to get more info? **</summary>

- [NIXOS Config Guide](https://www.youtube.com/watch?v=AGVXJ-TIv3Y&t=34s)
- [VIMJOYER YouTube Channel](https://www.youtube.com/@vimjoyer/videos)
- [Librephoenix YouTube Channel](https://www.youtube.com/@librephoenix)
- [8 Part Video Series on NIXOS](https://www.youtube.com/watch?v=QKoQ1gKJY5A&list=PL-saUBvIJzOkjAw_vOac75v-x6EzNzZq-)
- [Great guide for NixOS and Flakes](https://nixos-and-flakes.thiscute.world/preface)

</details>

<details>
<summary>**🏤 Where can I get info on using GIT repositories  **</summary>

- [Managing NIXOS config with GIT](https://www.youtube.com/watch?v=20BN4gqHwaQ)
- [GIT for dummies](https://www.youtube.com/watch?v=K6Q31YkorUE)
- [How GIT works](https://www.youtube.com/watch?v=e9lnsKot_SQ)
- [In depth 1hr video on GIT](https://www.youtube.com/watch?v=S7XpTAnSDL4&t=123s)

</details>

<details>
<summary>**How to I change the waybar?**</summary>

- Go to the `~/zaneyos/host/HOSTNAME`
- Edit the `variables.nix` file
- Find the line that starts `waybarChoice`
- Change the name to one of the available files
- `waybar-simple.nix`, `waybar-curved.nix`, or `waybar-ddubs.nix`
- Save the file and exit
- You need to do a rebuild to make the change effective
- Run the `zcli rebuild` command or `fr` "flake rebuild" to start the rebuild
  process

```json
# Set Waybar
# Includes alternates such as waybar-simple.nix, waybar-curved.nix & waybar-ddubs.nix
waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;
```

</details>

<details>
<summary>** How do I change the Timezone? **</summary>

1. In the file, `~/zaneyos/modules/core/system.nix`
2. Edit the line: time.timeZone = "America/New_York";
3. Save the file and rebuild using the `fr` alias.

</details>

<details>
<summary>**How do I change the monitor settings? **</summary>

Monitor settings are in the file: `~/zaneyos/hosts/<HOSTNAME>/variables.nix`

Inside the quotes the syntax is "monitor=video apapter,resolution@refresh rate,
auto,scale" Monitor must be in all lowercase. If you are not sure of your video
devices run `hyprctl monitors` at a terminal CLI. The output will look similar
to this:

```text
hyprctl monitors
Monitor HDMI-A-1 (ID 0):
	2560x1440@143.91200 at 0x0
	description: Dell Inc. DELL S3222DGM F45WJK3
	make: Dell Inc.
	model: DELL S3222DGM
	serial: F45WJK3
	active workspace: 1 (1)
	special workspace: 0 ()
	reserved: 0 52 0 0
	scale: 1.00
	transform: 0
	focused: yes
	dpmsStatus: 1
	vrr: false
	solitary: 0
	activelyTearing: false
	directScanoutTo: 0
	disabled: false
	currentFormat: XRGB8888
	mirrorOf: none
	availableModes: 2560x1440@59.95Hz 2560x1440@143.91Hz 2560x1440@120.00Hz 1920x1200@59.95Hz 1920x1080@143.86Hz 1920x1080@120.00Hz 1920x1080@119.88Hz 1920x1080@60.00Hz 1920x1080@60.00Hz 1920x1080@59.94Hz 1920x1080@50.00Hz 1600x1200@60.00Hz 1680x1050@59.88Hz 1280x1024@75.03Hz 1280x1024@60.02Hz 1440x900@59.95Hz 1280x800@59.91Hz 1152x864@75.00Hz 1280x720@120.00Hz 1280x720@119.88Hz 1280x720@60.00Hz 1280x720@59.94Hz 1280x720@50.00Hz 1024x768@75.03Hz 1024x768@60.00Hz 800x600@75.00Hz 800x600@60.32Hz 720x576@50.00Hz 720x576@50.00Hz 720x480@60.00Hz 720x480@60.00Hz 720x480@59.94Hz 720x480@59.94Hz 640x480@75.00Hz 640x480@60.00Hz 640x480@59.94Hz 640x480@59.94Hz 720x400@70.08Hz
```

Edit the `extraMonitorSettings` line. **Examples:**

- Single Monitor: `extraMonitorSettings = "monitor=eDP-1,1920x1080@60,auto,1";`
- Multiple Monitors:
  `extraMonitorSettings = "
            monitor=eDP-1,1920x1080@60,auto,auto
            monitor=HDMI-A-1,2560x1440@75,auto,auto
            ";`

- For more complex, multi-monitor configurations, you may wish to use the GUI
  application, `nwg-displays` This will show your currently connected monitors
  allowing you to use the mouse match how they are physicall arranged. E.g. what
  monitor is to the left, right, up or down. It is very similar to the X11 based
  tool, `arandr` It will then create a Hyprland compatible configuration file at
  `~/.config/hypr/monitors.conf`

<img align="center" width="90%" src="https://gitlab.com/Zaney/zaneyos/-/raw/main/img/nwg-displays.png" />

After you finish configring the monitors as you wish, hit `Apply` to save the
changes to `~/.config/hypr/monitors.conf`\
The contents will look something like this:

```text
# Generated by nwg-displays on 2025-03-20 at 13:13:49. Do not edit manually.
monitor=HDMI-A-1,1920x1080@74.97,2136x268,1.0
monitor=eDP-1,1920x1080@144.0,216x268,1.0
```

You only need to copy the `monitor=` lines and paste them into the
`variables.nix` file as described in the process above.

Once you have that done. Run the command `zcli rebuild` or alias `fr` to build a
new generation to make the changes effective.

More information on configuring monitors is available on the
[Hyprland Wiki](https://wiki.hyprland.org/Configuring/Monitors/)

</details>

<details>
<summary>**How do I add applications to ZaneyOS? **</summary>

### There are two options. One for all hosts you have, another for a specific host.

1. For applications to be included in all defined hosts edit the
   `~/zaneyos/modules/core/packages.nix` file.

There is a section that begins with: `environment.systemPackages = with pkgs;`

Followed by a list of packages These are required for ZaneyOS.

We suggest you add a comment at the end of the package names. Then add in your
packages.

```text
    ...
    virt-viewer
    wget
    ###  My Apps ### 
    bottom
    dua
    emacs-nox
    fd
    gping
    lazygit
    lunarvim
    luarocks
    mission-center
    ncdu
    nvtopPackages.full
    oh-my-posh
    pyprland
    shellcheck
    multimarkdown
    nodejs_23
    ugrep
    zoxide
  ];
}
```

2. For applications that will only be on specific host.

You edit the `host-packages.nix` associated with that host.
`~/zaneyos/hosts/<HOSTNAME>/host-packages.nix`

The part of the file you need to edit, looks like this:

```nix
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    obs-studio
  ];
}
```

You can add additional packages, or for example change `discord` to
`discord-canary` to get the beta version of Discord but only on this host.

</details>

<details>

<summary>** I added the package names, now how do I install them ? **</summary>

- Use the command `zcli rebuild` or `fr`, Flake Rebuild alias.

If the rebuild completes successfully, a new generation with your added packages
will be created.

</details>

<details>
<summary>** How do I update the packages I've already installed? **</summary>

- Use the command `zcli update` or the `fu`, Flake Update alias. This will check
  for updated packages, download and install them.

</details>

<details>
<summary>** I made a change to my ZaneyOS configuration, how do I activate it? **</summary>

- Use the command `zcli rebuild` or `fr` Flake Rebuild alias. If you **created a
  new file** please note you will need to run a `git add .` command in the
  `zaneyos` folder. If successful, a new generation will be generated with your
  changes. A logout or reboot could be required depending on what you changed.

</details>

<details>
<summary>** How can I configure a different kernel on a specific host? **</summary>

1. You have to edit the `hardware.nix` file for that host in
   `~/zaneyos/hosts/HOSTNAME/hardware.nix` and override the default.
2. Near the top you will find this section of the `hardware.nix` file.

```nix
boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_usb_sdmmc"];
boot.initrd.kernelModules = [];
boot.kernelModules = ["kvm-intel"];
boot.extraModulePackages = [];
```

3. Add the override. E.g. to set the kernel to 6.12.

- `boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_12;`

4. The updated code should look like this:

```nix
boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_usb_sdmmc"];
boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_12;
boot.initrd.kernelModules = [];
boot.kernelModules = ["kvm-intel"];
boot.extraModulePackages = [];
```

5. Use the command `zcli rebuild` or the alias `fr` to create a new generation
   and reboot to take effect.

</details>

<details>

<summary>** What are the major Kernel options in NixOS? **</summary>
NixOS offers several major kernel types to cater to different needs and preferences. Below are the available options, excluding specific kernel versions:

1. **`linuxPackages`**
   - The default stable kernel, typically an LTS (Long-Term Support) version.
     LTS in 25.05 (warbler) is 6.12.x Older kernels, 6.6.x, 6.8.x are not
     supported.

2. **`linuxPackages_latest`**
   - The latest mainline kernel, which may include newer features but could be
     less stable.

3. **`linuxPackages_zen`**
   - A performance-optimized kernel with patches aimed at improving
     responsiveness and interactivity. Commonly used by gamers and desktop
     users.

4. **`linuxPackages_hardened`**
   - A security-focused kernel with additional hardening patches for enhanced
     protection.

5. **`linuxPackages_rt`**
   - A real-time kernel designed for low-latency and time-sensitive
     applications, such as audio production or robotics.

6. **`linuxPackages_libre`**
   - A kernel stripped of proprietary firmware and drivers, adhering to free
     software principles.

7. **`linuxPackages_xen_dom0`**
   - A kernel tailored for running as the host (dom0) in Xen virtualization
     environments.

8. **`linuxPackages_mptcp`**
   - A kernel with support for Multipath TCP, useful for advanced networking
     scenarios.

</details>

<details>

<summary>**  I have older generations I want to delete, how can I do that? **</summary>

- The `zcli cleanup` command or the `ncg` `(NixOS Clean Generations)` alias will
  remove **ALL** but the most current generation. Make sure you have booted from
  that generation before using this alias. There is also a schedule that will
  remove older generations automatically over time.

</details>

<details>

<summary>**How do I change the hostname? **</summary>

To change the hostname, there are several steps and you will have to reboot to
make the change effective.

1. Copy the directory of the host you want to rename to a directory with the new
   name.

- `cp -rpv ~/zaneyos/hosts/OLD-HOSTNAME ~/zaneyos/hosts/NEW-HOSTNAME`

2. Edit the `~/zaneyos/flake.nix` file. Change the line:

- `host = "NEW-HOSTNAME"`

3. In the `~/zaneyos` Directory run `git add .` _The rebuild will fail with a
   'file not found' error if you forget this step._

4. Use the command `zcli rebuild` or the `fr` alias to create a new generation
   with the new hostname. You must reboot to make the change effective.

</details>
<details>
<summary>** How do I disable the spinning snowflake at startup? **</summary>

1. Edit the `~/zaneyos/modules/core/boot.nix` file.
2. Look for:

```nix
};
 plymouth.enable = true;
};
```

3. Change it to `false`
4. Run the command `zcli rebuild` or the alias `fr` to create a new generation.

</details>

<details>
 <summary>** How do I configure my hybrid laptop with Intel/NVIDIA GPUs?  **</summary>

1. Either run the `install-zaneyos.sh` script and select `nvidia-laptop`
   template or if configuring manually, set the template in the `flake.nix` to
   `nvidia-prime`

2. In the `~/zaneyos/hosts/HYBRID-HOST/variables.nix` file you will need to set
   the PCI IDs for the Intel and NVIDIA GPUs. Refer to
   [this page](https://nixos.wiki/wiki/Nvidia) to help determine those values.

3. Once you have everything configured properly, use the command `zcli rebuild`
   or the `fr` Flake Rebuild alias to create a new generation.

4. In the `~/zaneyos/modules/home/hyprland/config.nix` file is an ENV
   setting`"AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"` This sets the primary
   and secondary GPUs. Using the info from the weblink above you might have to
   change the order of these values.

</details>

</div>

</details>

<details>
<summary>**🎨 Stylix**</summary>

<div style="margin-left: 20px;">

<details>
<summary>How do I enable or disable Stylix? </summary>

- To Enable:

1. Edit the `~/zaneyos/modules/core/stylix.nix` file.
2. Comment out from `base16Scheme` to the `};` after `base0F`

```nix
# Styling Options
  stylix = {
    enable = true;
    image = ../../wallpapers/Anime-girl-sitting-night-sky_1952x1120.jpg;
    #image = ../../wallpapers/Rainnight.jpg;
    #image = ../../wallpapers/zaney-wallpaper.jpg;
    #  base16Scheme = {
    #  base00 = "282936";
    #  base01 = "3a3c4e";
    #  base02 = "4d4f68";
    #  base03 = "626483";
    #  base04 = "62d6e8";
    #  base05 = "e9e9f4";
    #  base06 = "f1f2f8";
    #  base07 = "f7f7fb";
    #  base08 = "ea51b2";
    #  base09 = "b45bcf";
    #  base0A = "00f769";
    #  base0B = "ebff87";
    #  base0C = "a1efe4";
    #  base0D = "62d6e8";
    #  base0E = "b45bcf";
    #  base0F = "00f769";
    #};
    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
```

3. Select the image you want stylix to use for the colorpalette.
4. Run command `zcli rebuild` or the `fr` alias to create a new generation with
   this colorscheme.

- To disable uncomment

1. Edit the `~/zaneyos/modules/core/stylix.nix` file.
2. Uncomment out from `base16Scheme` to the `};` after `base0F`

```nix
 base16Scheme = {
  base00 = "282936";
  base01 = "3a3c4e";
  base02 = "4d4f68";
  base03 = "626483";
  base04 = "62d6e8";
  base05 = "e9e9f4";
  base06 = "f1f2f8";
  base07 = "f7f7fb";
  base08 = "ea51b2";
  base09 = "b45bcf";
  base0A = "00f769";
  base0B = "ebff87";
  base0C = "a1efe4";
  base0D = "62d6e8";
  base0E = "b45bcf";
  base0F = "00f769";
};
```

3. Run the command `zcli rebuild` or the `fr` alias to build a new generation
   with either the default dracula or set your own custom colors

</details>

<details>
 <summary>How do I change the image Stylix uses to theme with?</summary>

1. Edit the `~/zaneyos/hosts/HOSTNAME/varibles.nix`
2. Change the `stylixImage =` to the filename you want to use. Wallpapers are in
   `~/zaneyos/wallpapers`

```nix
# Set Stylix Image
stylixImage = ../../wallpapers/AnimeGirlNightSky.jpg;
```

</details>

</div>

</details>

<details>
<summary>**🌃 Wallpapers**</summary>

<div style="margin-left: 20px;">

<details>
<summary>**  How do I add more wallpapers? **</summary>

- Wallpapers are stored in the `~/zaneyos/wallpapers` directory.
- Simply copy the new ones to that diretory.
- You must do a rebuild after adding new wallpapers.
- Run the command `zcli rebuild` or the `fr` alias at the CLI.

</details>

<details>

<summary>** How do I change the background? **</summary>

- SUPER + ALT + W will select a new background

</details>

<details>

<summary>**  How can I set a timer to change the wallpaper automatically?  **</summary>

1. Edit the `~/zaneyos/modules/home/hyprland/config.nix` file.
2. Comment out the line `sleep 1.5 && swww img ...`
3. Add new line after that with `sleep 1 && wallsetter`

```json
settings = {
     exec-once = [
       "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
       "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
       "killall -q swww;sleep .5 && swww init"
       "killall -q waybar;sleep .5 && waybar"
       "killall -q swaync;sleep .5 && swaync"
       "nm-applet --indicator"
       "lxqt-policykit-agent"
       "pypr &"
       #"sleep 1.5 && swww img /home/${username}/Pictures/Wallpapers/zaney-wallpaper.jpg"
       "sleep 1 && wallsetter"
     ];
```

4. Run the command `zcli rebuild` or the alias `fr` to create a new generation.
5. You will need to logout or reboot to make the change effective.

</details>

<details>

<summary>**How do I change the interval the wallpaper changes?  **</summary>

1. Edit the `~/zaneyos/modules/home/scripts/wallsetter`
2. Change the `TIMEOUT =` value. Which is in seconds.
3. Run the command `zcli rebuild` or alias `fr` to create a new generation.
4. You will need to logout or reboot to make the change effective.

</details>

</div>

</details>

<details>
<summary>**⬆ How do I update ZaneyOS?  **</summary>

<div style="margin-left: 20px;">

<details>
<summary> For version v2.3 </summary>

Use the automated v2.3 → v2.4 upgrade. See ZaneyOS-Upgrade.md and UPGRADE-2.3-to-2.4.md. To avoid overwriting your config before a backup is created, fetch just the script without modifying your working tree:

- Git (recommended):
```bash
git -C ~/zaneyos fetch origin
git -C ~/zaneyos show origin/main:upgrade-2.3-to-2.4.sh > ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```
- Curl:
```bash
curl -fsSL https://gitlab.com/zaney/zaneyos/-/raw/main/upgrade-2.3-to-2.4.sh -o ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```
Then run the script: `~/upgrade-2.3-to-2.4.sh`. It will create a full backup before switching branches and migrate your hosts safely from the backup.

**IMPORTANT:**
- Do NOT use the `fu` or `fr` aliases for this upgrade; the script uses a safe boot build.
- If you have made extensive modifications, do not run the script. Read the docs above and migrate manually instead.

</details>

<details>
 <summary> For versions v2.0->2.2 </summary>

1. First backup your existing `zaneyos` directory. e.g.
   `cp -r ~/zaneyos ~/zaneyos-backup`

2. There is no direct update. When you clone the the new config the config files
   and layout have changed.

3. You need to install zaneyos like a new install. `./install-zaneyos.sh`

4. Once the build completes and you have rebooted you can review the new layout
   and decide what if any changes you made on the earlier version can be
   migrated to v2.3.

</details>

<details>
 <summary> For version v1.x </summary>

1. The layout and configuration are completely different. Virtually noting from
   1.x is applicable to v2.3.

2. Backup your `zaneyos` directory e.g. `cp -r ~/zaneyos ~/zaneyos-backup`

3. Run the `./install-zaneyos.sh` script and follow the new install
   instructions.

</details>

<details>
<summary> How do I know when a new version of ZaneyOS is released? </summary>

It will be announced on the Zaney [Discord](https://discord.gg/W7efsSDS) server.

</details>

</div>

</details>

</div>

<details><summary>**📂 ZaneyOS v2.3 Layout**</summary>

<div style="margin-left: 25px;">

** 📂 ~/zaneyos **

```text
~/zaneyos/
    ├── hosts/                      # Folder where host configs are saved
    │   ├── default                 # Default host template
    │   └── nixstation              # Zaney's host 
    ├── img/                        # Images for README.md
    ├── modules/                    # Core, HomeMgr, drivers config files
    │   └── drivers/                # AMD,NVIDA,Intel,VM config files
    │   └── core/                   # Services, packages, fonts, etc
    │   └── home/                   # Home Manager config files
    │    ├── fastfetch/             # Fastfetch config 
    │    ├── hyprland/              # Hyrprland configs
    │    ├── rofi/                  # rofi menu configs
    │    ├── scripts/               # screenshots, wallpaper, etc.
    │    ├── waybar/                # waybar configs in NIX format
    │    ├── wlogout/               # Theme, config for logout menu
    │    ├── yazi/                  # TUI filemgr config file
    │    └── zsh/                   # Theme and settings for ZSH
    ├── profiles/                   # Video hardware templates
    │    ├── amd/                   # AMD Video config files
    │    ├── intel/                 # Intel video config files
    │    ├── nvidia/                # NVIDIA discrete video config files
    │    ├── nvidia-laptop/         # NVIDIA Hybrid video config files
    │    └── vm/                    # Virtual Machine config files
    ├── wallpapers/                 # Add your wallpapers here 
    ├── CHANGELOG.md                # List of changes
    ├── CONTRIBUTING.md             # How you can help 
    ├── FAQ.md                      # Frequently Asked Questions
    ├── flake.lock                  # Saves version info on all installed packages
    ├── flake.nix                   # flake that controls ZaneyOS config
    ├── install-zaneyos.sh          # Install script for ZaneyOS
    ├── LICENSE                     # MIT license ZaneyOS is using
    └── README.md                   # Intro document for ZaneyOS
```

</div>

</details>

**---> 🧰 Miscellaneous**

<details>

<summary>**🪧 Rebuild or update fails with Home Manager error can't backup a file**</summary>

<div style="margin-left: 20px;">
<br>

```text
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: Please do one of the following:
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: - Move or remove the above files and try again.
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: - In standalone mode, use 'home-manager switch -b backup' to back up
May 08 18:33:57 explorer hm-activate-dwilliams[92420]:   files automatically.
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: - When used as a NixOS or nix-darwin module, set
May 08 18:33:57 explorer hm-activate-dwilliams[92420]:     'home-manager.backupFileExtension'
May 08 18:33:57 explorer hm-activate-dwilliams[92420]:   to, for example, 'backup' and rebuild.
May 08 18:33:57 explorer systemd[1]: home-manager-dwilliams.service: Main process exited, code=exited, status=1/FAILURE
May 08 18:33:57 explorer systemd[1]: home-manager-dwilliams.service: Failed with result 'exit-code'.
May 08 18:33:57 explorer systemd[1]: Failed to start Home Manager environment for dwilliams.
```

- Update: If you use the command `zcli rebuild` or `zcli upgrade` it will remove
  the common cause of this If you find an issue and fix it, or provide a new
  feature, please share it.
- If you find more files that cause it you can add them to
  `~/zaneyos/modules/home/scripts/default.nix`
- There is a script `hm-find` That will search the journal and if found,
- It will prompt you to delete these backups
- It creates a log as well
- Note: The script is not perfect
- If you get this msg but `hm-find` doesn't report any you will have to search
  manually e.g `journalctl | grep hm-activate`
- You can now redo your rebuild
- If you ran `fu` for `flake update` you can now do `fr` for `flake rebuild`
- The flake has already been updated

</div>
</details>

<details>

<summary>**📚 What is the difference between Master and Dwindle layouts**</summary>

<div style="margin-left: 20px;">
<br>

**1. Master Layout**

- The **Master** layout divides the workspace into two main areas:
  - A **master area** for the primary window, which takes up a larger portion of
    the screen.
  - A **stack area** for all other windows, which are tiled in the remaining
    space.
- This layout is ideal for workflows where you want to focus on a single main
  window while keeping others accessible.

**2. Dwindle Layout**

- The **Dwindle** layout is a binary tree-based tiling layout:
  - Each new window splits the available space dynamically, alternating between
    horizontal and vertical splits.
  - The splits are determined by the aspect ratio of the parent container (e.g.,
    wider splits horizontally, taller splits vertically).
- This layout is more dynamic and evenly distributes space among all windows.

---

**How to Verify the Current Layout**

To check which layout is currently active, use the `hyprctl` command:

`hyprctl getoption general:layout`

</details>
</div>

</details>

<details>
<summary>**📦 What are the Yazi keybindings and how can I change them? **</summary>

<div style="margin-left: 20px;"> <br>

The Yazi configuration file is located in `~/zaneyos/modules/home/yazi.nix`

`Yazi` is configured like VIM and VIM motions

The keymap is in the `~/zaneyos/modules/home/yazi/keymap.toml` file

</div>
</details>

<details>

<summary>** What fonts are avialable in NixOS**</summary>

```nix
{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      fira-code
      fira-code-symbols
      font-awesome
      hackgen-nf-font
      ibm-plex
      inter
      jetbrains-mono
      material-icons
      maple-mono.NF
      minecraftia
      nerd-fonts.im-writing
      nerd-fonts.blex-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-monochrome-emoji
      powerline-fonts
      roboto
      roboto-mono
      symbola
      terminus_font
      # NERD fonts 
      nerd-fonts.0xproto
      nerd-fonts._3270
      nerd-fonts.agave
      nerd-fonts.anonymice
      nerd-fonts.arimo
      nerd-fonts.aurulent-sans-mono
      nerd-fonts.bigblue-terminal
      nerd-fonts.bitstream-vera-sans-mono
      nerd-fonts.blex-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.caskaydia-mono
      nerd-fonts.code-new-roman
      nerd-fonts.comic-shanns-mono
      nerd-fonts.commit-mono
      nerd-fonts.cousine
      nerd-fonts.d2coding
      nerd-fonts.daddy-time-mono
      nerd-fonts.departure-mono
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.droid-sans-mono
      nerd-fonts.envy-code-r
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.geist-mono
      nerd-fonts.go-mono
      nerd-fonts.gohufont
      nerd-fonts.hack
      nerd-fonts.hasklug
      nerd-fonts.heavy-data
      nerd-fonts.hurmit
      nerd-fonts.im-writing
      nerd-fonts.inconsolata
      nerd-fonts.inconsolata-go
      nerd-fonts.inconsolata-lgc
      nerd-fonts.intone-mono
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      nerd-fonts.iosevka-term-slab
      nerd-fonts.jetbrains-mono
      nerd-fonts.lekton
      nerd-fonts.liberation
      nerd-fonts.lilex
      nerd-fonts.martian-mono
      nerd-fonts.meslo-lg
      nerd-fonts.monaspace
      nerd-fonts.monofur
      nerd-fonts.monoid
      nerd-fonts.mononoki
      nerd-fonts.mplus
      nerd-fonts.noto
      nerd-fonts.open-dyslexic
      nerd-fonts.overpass
      nerd-fonts.profont
      nerd-fonts.proggy-clean-tt
      nerd-fonts.recursive-mono
      nerd-fonts.roboto-mono
      nerd-fonts.shure-tech-mono
      nerd-fonts.sauce-code-pro
      nerd-fonts.space-mono
      nerd-fonts.symbols-only
      nerd-fonts.terminess-ttf
      nerd-fonts.tinos
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
      nerd-fonts.ubuntu-sans
      nerd-fonts.victor-mono
      nerd-fonts.zed-mono

    ];
  };
}
```

</details>

**---> 🖥️ Terminals **

<details>
<summary>**🐱  Kitty**</summary>

<details>

<summary>My cursor in Kitty is "janky" and it jumps around. How do I fix that?</summary>

- That feature is called "cursor_trail" in the
  `~/zaneyos/modules/home/kitty.nix` file.

1. Edit that file and change the `cursor_trail 1` to `cursor_trail 0` or comment
   out that line.
2. Use the command alias `zcli rebuild` or the `fr` to create a new generation
   with the change.

</details>

<details>
 <summary>What are the Kitty keybindings and how can I change them?</summary>

The kitty bindings are configured in `~/zaneyos/modules/home/kitty.nix`

The defaults are:

```text
    # Clipboard
    map ctrl+shift+v        paste_from_selection
    map shift+insert        paste_from_selection

    # Scrolling
    map ctrl+shift+up        scroll_line_up
    map ctrl+shift+down      scroll_line_down
    map ctrl+shift+k         scroll_line_up
    map ctrl+shift+j         scroll_line_down
    map ctrl+shift+page_up   scroll_page_up
    map ctrl+shift+page_down scroll_page_down
    map ctrl+shift+home      scroll_home
    map ctrl+shift+end       scroll_end
    map ctrl+shift+h         show_scrollback

    # Window management
    map alt+n               new_window_with_cwd      #Opens new window in current directory
    #map alt+n               new_os_window           #Opens new window in $HOME dir
    map alt+w               close_window
    map ctrl+shift+enter    launch --location=hsplit
    map ctrl+shift+s        launch --location=vsplit
    map ctrl+shift+]        next_window
    map ctrl+shift+[        previous_window
    map ctrl+shift+f        move_window_forward
    map ctrl+shift+b        move_window_backward
    map ctrl+shift+`        move_window_to_top
    map ctrl+shift+1        first_window
    map ctrl+shift+2        second_window
    map ctrl+shift+3        third_window
    map ctrl+shift+4        fourth_window
    map ctrl+shift+5        fifth_window
    map ctrl+shift+6        sixth_window
    map ctrl+shift+7        seventh_window
    map ctrl+shift+8        eighth_window
    map ctrl+shift+9        ninth_window
    map ctrl+shift+0        tenth_window

    # Tab management
    map ctrl+shift+right    next_tab
    map ctrl+shift+left     previous_tab
    map ctrl+shift+t        new_tab
    map ctrl+shift+q        close_tab
    map ctrl+shift+l        next_layout
    map ctrl+shift+.        move_tab_forward
    map ctrl+shift+,        move_tab_backward

    # Miscellaneous
    map ctrl+shift+up      increase_font_size
    map ctrl+shift+down    decrease_font_size
    map ctrl+shift+backspace restore_font_size
```

</details>
</details>

<details>

<summary>**🇼  WezTerm**</summary>

<div style="margin-left: 20px;">

<details>

<summary>How do I enable WezTerm?</summary>

Edit the `/zaneyos/modules/home/wezterm.nix` Change `enable = false` to
`enable = true;`\
Save the file and rebuild `zaneyos` with the `zcli rebild` command or the `fr`
alias

```
{pkgs, ...}: {
  programs.wezterm = {
    enable = false;
    package = pkgs.wezterm;
  };
```

</details>

<details>
 <summary>What are the WezTerm keybindings and how can I change them?</summary>

The kitty bindings are configured in `~/zaneyos/modules/home/wezterm.nix`

The defaults are:

```text
ALT is the defined META key for WezTerm
  -- Tab management
ALT + t                 Open new Tab
ALT + w                 Close current Tab
ALT + n                 Move to next Tab
ALT + p                 Move to previous Tab 
  -- Pane management
ALT + v                 Create Vertical Split
ALT + h                 Create Horizontal Split
ALT + q                 Close Current Pane
   -- Pane navigation (move between panes with ALT + Arrows)
ALT + Left Arrow        Move to pane -- Left
ALT + Right Arrow       Move to pane -- Right
ALT + Down Arrow        Move to pane -- Down
ALT + Up Arrow          Move to pane -- Down
```

</details>
</div>
</details>

<details>
<summary>**👻 Ghostty **</summary>

<div style="margin-left: 20px;">

<details>
<summary> How do I enable the ghostty terminal? </summary>

1. Edit the `~/zaneyos/modules/home/ghostty.nix` file.
2. Change `enable = true;`
3. Run the command alias `fr` to create a new generation.

</details>

<details>

<summary> How do I change the ghostty theme?   </summary>

1. Edit the `~/zaneyos/modules/home/ghostty.nix` file.
2. There are several example themes included but commented out.

```text
#theme = Aura
theme = Dracula
#theme = Aardvark Blue
#theme = GruvboxDarkHard
```

3. Comment out `Dracula` and either uncomment one of the others or add one of
   ghostty's many themes.

</details>

<details>
<summary> What are the default `ghostty` keybindings?  </summary>

```text
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
```

</details>
</div>
</details>

**
--> 🪧  General NixOS related topics
**

<details>
<summary>**❄  What are Flakes in NixOS? **</summary>

<div style="margin-left: 20px;">

**Flakes** are a feature of the Nix package manager that simplifies and
standardizes how configurations, dependencies, and packages are managed. If
you're familiar with tools like `package.json` in JavaScript or `Cargo.toml` in
Rust, flakes serve a similar purpose in the Nix ecosystem.

** Key Features of Flakes: **

1. **Pin Dependencies**:
   - Flakes lock the versions of dependencies in a `flake.lock` file, ensuring
     reproducibility across systems.

2. **Standardize Configurations**:
   - They use a `flake.nix` file to define how to build, run, or deploy a
     project or system, making setups more predictable.

3. **Improve Usability**:
   - Flakes simplify sharing and reusing configurations across different systems
     or projects by providing a consistent structure.

In essence, flakes help manage NixOS setups or Nix-based projects in a more
portable and reliable way.

</div>

</details>

<details>
<summary>**🏡  What is NixOS Home Manager? **</summary>

**Home Manager** is a powerful tool in the Nix ecosystem that allows you to
declaratively manage user-specific configurations and environments. With Home
Manager, you can streamline the setup of dotfiles, shell settings, applications,
and system packages for your user profile.

### Key Features of Home Manager:

1. **Declarative Configuration**:
   - Define all your settings and preferences in a single `home.nix` file,
     making it easy to track, share, and replicate your setup.

2. **Cross-Distribution Support**:
   - Home Manager works not only on NixOS but also on other Linux distributions
     and macOS, allowing you to standardize configurations across devices.

3. **User Environment Management**:
   - Manage applications, environment variables, shell configurations, and
     more—all isolated to your user profile.

### Why Use Home Manager?

Home Manager simplifies system management by offering consistency,
reproducibility, and portability. Whether you’re customizing your development
environment or sharing configurations between machines, it provides an efficient
way to tailor your user experience.

</details>

<details>
<summary>**🏭  What are Atomic Builds?**</summary>

**Atomic builds** in NixOS ensure that any system change (like installing
software or updating the configuration) is applied in a safe and fail-proof way.
This means that a system update is either fully successful or has no effect at
all, eliminating the risk of a partially applied or broken system state.

### How Atomic Builds Work:

1. **Immutable System Generation**:
   - Every configuration change creates a new "generation" of the system, while
     the previous ones remain untouched. You can easily roll back to an earlier
     generation if something goes wrong.

2. **Transaction-Like Behavior**:
   - Similar to database transactions, changes are applied atomically: either
     they succeed and become the new active system, or they fail and leave the
     current system unchanged.

3. **Seamless Rollbacks**:
   - In case of errors or issues, you can reboot and select a previous system
     generation from the boot menu to return to a working state.

### Benefits of Atomic Builds:

- **Reliability**: Your system is always in a consistent state, even if a
  configuration change fails.
- **Reproducibility**: The same configuration will always produce the same
  system state, making it easy to debug or replicate.
- **Ease of Rollback**: Reverting to a working configuration is as simple as
  rebooting and selecting the previous generation.

### Why NixOS Uses Atomic Builds:

This feature is a cornerstone of NixOS's declarative and reproducible design
philosophy, ensuring that system management is predictable and stress-free.

</details>

<details>
<summary>**❓ I am new to NIXOS where can I go to get more info? **</summary>

- [NIXOS Config Guide](https://www.youtube.com/watch?v=AGVXJ-TIv3Y&t=34s)
- [VIMJOYER YouTube Channel](https://www.youtube.com/@vimjoyer/videos)
- [Librephoenix YouTube Channel](https://www.youtube.com/@librephoenix)
- [8 Part Video Series on NIXOS](https://www.youtube.com/watch?v=QKoQ1gKJY5A&list=PL-saUBvIJzOkjAw_vOac75v-x6EzNzZq-)
- [Great guide for NixOS and Flakes](https://nixos-and-flakes.thiscute.world/preface)

</details>

<details>
<summary>**🏤 Where can I get info on using GIT repositories  **</summary>

- [Managing NIXOS config with GIT](https://www.youtube.com/watch?v=20BN4gqHwaQ)
- [GIT for dummies](https://www.youtube.com/watch?v=K6Q31YkorUE)
- [How GIT works](https://www.youtube.com/watch?v=e9lnsKot_SQ)
- [In depth 1hr video on GIT](https://www.youtube.com/watch?v=S7XpTAnSDL4&t=123s)

</details>
