# 📋 ZaneyOS Changelog

> ** ✨ A comprehensive history of changes, improvements, and updates to
> ZaneyOS**

---

# 🚀 **Current Release - ZaneyOS v2.4**

#### 📅 **Updated: September 18th, 2025**

- 🧪 EXPERIMENTAL: AMD+NVIDIA hybrid support (amd-hybrid)
  - New driver module: `modules/drivers/nvidia-amd-hybrid.nix` (options: `enable`, `amdgpuBusID`, `nvidiaBusID`)
  - Kernel pin: `boot.kernelPackages` forced to `linuxPackages_6_12` when enabled (required for RTX 50xx open kernel module)
  - New profile: `profiles/amd-hybrid/default.nix` (wires `amdgpuID`/`nvidiaID` from `hosts/<host>/variables.nix`)
  - zcli detection updated to recognize `amd-hybrid`; `install-zaneyos.sh` prompts include `amd-hybrid`
  - Added `amdgpuID` to `hosts/*/variables.nix`
  - Docs updated (`README`, `WARP.md`, cheatsheets)
  - Caution: Can't fully test at this time. Please verify your Bus IDs via `lspci` and use `zcli rebuild-boot` for safer activation

#### 📅 **Updated: September 9th, 2025**

- 🛡️ Installer: Added defensive hostname validation and sanitization
  - Prevents invalid hostnames (e.g., with dots) from causing Nix evaluation errors
  - Auto-sanitizes to a compliant hostname (letters/digits with '-' or '_', 1–63 chars) and prompts for confirmation
  - Explicitly rejects 'default' to avoid template overwrites
- 🧩 Nix: Added assertion in modules/core/network.nix for clearer errors if an invalid hostname is provided

#### 📅 **Updated: August 30th, 2025**

- Merged `dev` branch to `main` in preparation of v2.4 release
- SDDM is now default, but you can change back to TUI greetd
- Now the `hosts/HOSTNAME/variables.nix` has options to enable apps and features

```nix
# Set Displau Manager
  # `tui` for Text login
  # `sddm` for graphical GUI (default)
  # SDDM background is set with stylixImage
  displayManager = "sddm";

  # Emable/disable bundled applications
  tmuxEnable = false;
  alacrittyEnable = false;
  weztermEnable = false;
  ghosttyEnable = false;
  vscodeEnable = false;
  # Note: This is evil-helix with VIM keybindings by default
  helixEnable = false;
  #To install: Enable here, rebuild, then run zcli doom install
  doomEmacsEnable = false;
```

- As a result of this change, you can't just `git pull` and rebuild
- The new variables and other changes will cause the build to fail
- If you are on `zaneyos v2.3` read the upgrade documentation
- Began process to translate documents into Spanish (Machine translated)
- README.es.md
- FAQ.es.md
- ZaneyOS-Upgrade.es.md
- TESTING-UPGRADE.es.md
- UPGRADE-2.3-to-2.4.es.md
- zcli.es.md
- Added `~/zaneyos/cheatsheets/project-guide.md`
- This is an overview of how ZaneyOS is laid out

#### 📅 **Updated: August 21st, 2025**

- 📚 **Cheatsheets Library**: Centralized, human-friendly docs under
  `cheatsheets/`
  - 🔗 Quick Links and directory tree in `cheatsheets/README.md`
  - 🧩 Topics added:
    - ✍️ Emacs — Getting started, File Explorer, Code Completion, Magit,
      Markdown
    - 🖥️ Terminals — Ghostty, Tmux, Alacritty, Kitty, WezTerm
    - 🪟 Hyprland — Keybindings (SUPERKEY notation) and Window Rules
    - 📂 Yazi — Keymap (navigation, selection, search, tabs, modes)

#### 📅 **Updated: August 20th, 2025**

- 📝 **Note Management Enhancement**: Added `note-from-clipboard` script and XDG
  compliance improvements
  - 🚀 **Clipboard Integration**: One-command clipboard text capture using
    existing `note` infrastructure
  - 🎯 **Smart Content Detection**: Automatically detects text/plain clipboard
    content vs images/other formats
  - 📮 **Desktop Notifications**: Comprehensive user feedback for success,
    failure, and skipped operations
  - ⚡ **Instant Timestamping**: Leverages existing colorful note system with
    automatic timestamp generation
  - 🛡️ **Non-destructive**: Only processes text content, safely ignores non-text
    clipboard data
  - 💻 **Terminal Ready**: Available system-wide via PATH after rebuild
  - 📁 **XDG Compliance**: Notes now saved to `~/.local/share/notes/notes.txt`
    following XDG Base Directory Specification
  - 🔍 **File Location Display**: Shows full file path in output to prevent user
    confusion about note storage location
  - 🛠️ **Auto-Directory Creation**: Creates notes directory automatically on
    first use

#### 📅 **Updated: August 19th, 2025**

- 🔄 **Upgrade System Enhancement**: Comprehensive upgrade infrastructure for
  ZaneyOS 2.3 → 2.4 migrations
  - 🚀 **Automated Upgrade Script**: `upgrade-2.3-to-2.4.sh` with complete
    migration automation
    - 💾 **Complete Backup System**: Timestamped backups with organized storage
      in `~/.config/zaneyos-backups/`
    - 🔍 **Version Validation**: Automatic detection of ZaneyOS 2.3 vs 2.4+ to
      prevent incorrect upgrades
    - 🧬 **Variable Migration**: Comprehensive migration of 15+ configuration
      variables from 2.3 to 2.4 format
    - 🖥️ **Terminal Dependency Handling**: Automatic enabling of terminal
      applications (critical for 2.4 compatibility)
    - 🎨 **Theme Preservation**: Migration of stylixImage, waybarChoice,
      animChoice, and monitor settings
    - 🛡️ **Safe Build Process**: Uses `boot` instead of `switch` to prevent SDDM
      display manager conflicts
    - 📝 **Comprehensive Logging**: Detailed logs with timestamps for
      troubleshooting
  - ↩️ **One-Command Revert**: `revert-to-2.3.sh` and
    `upgrade-2.3-to-2.4.sh --revert` for easy rollback
  - 📚 **Complete Documentation**: `UPGRADE-2.3-to-2.4.md` with detailed
    instructions and troubleshooting
  - ⚠️ **Legacy Documentation**: Updated `ZaneyOS-Upgrade.md` to deprecate
    manual process and redirect to automated system
  - 🔧 **Hardware Preservation**: Automatic migration of hardware.nix and
    host-specific configurations
  - 🎯 **User Experience**: Interactive prompts, colored output, progress
    indicators, and clear error messages

- 🛠️ **ZCLI Enhancement v1.0.2**: Major upgrade to the ZaneyOS CLI utility with
  comprehensive new features
  - 🔥 **Doom Emacs Management**: Complete lifecycle management for Doom Emacs
    - 🚀 `doom install` - Automated installation using get-doom script with all
      required packages
    - ✅ `doom status` - Installation verification with version information
      display
    - 🗑️ `doom remove` - Safe removal with confirmation prompts to prevent
      accidents
    - 🔄 `doom update` - Package and configuration updates via doom sync
  - ⚙️ **Advanced Build Options**: Enhanced command-line arguments for precise
    control
    - 🔍 `--dry, -n` - Preview mode showing planned changes without execution
    - ❓ `--ask, -a` - Interactive confirmation prompts for safety-critical
      operations
    - 💻 `--cores N` - CPU core limiting for VMs and resource-constrained
      systems
    - 📋 `--verbose, -v` - Detailed operation logging and verbose output
    - 🎯 `--no-nom` - Disable nix-output-monitor for traditional output
  - 🏠 **Enhanced Host Management**: Improved host configuration tools
    - ➕ `add-host` - Create new host configurations with automated GPU
      detection
    - ➖ `del-host` - Safely remove host configurations with confirmation
      prompts
    - 🔄 `update-host` - Enhanced hostname/profile updating with validation
  - 🧹 **System Maintenance**: Improved cleanup and diagnostic capabilities
    - 🗂️ Automated log cleanup for old build logs during cleanup operations
    - 🛠️ Enhanced diagnostic reporting with comprehensive system information
    - ✂️ Safer trim operations with user confirmation prompts
  - 🛡️ **Safety Features**: Built-in safeguards and error handling
    - 🔒 Multiple confirmation prompts for destructive operations
    - 📝 Comprehensive error handling and user feedback
    - 🎛️ Multiple options can be combined for precise operational control

#### 📅 **Updated: August 11th, 2025**

- 🔧 **NeoVIM Enhancement**: Fixed DirtytalkUpdate automation for programming
  spellcheck
  - ✨ **Auto-download**: Wordlist now downloads automatically on first startup
  - 🔄 **Smart detection**: Only downloads if wordlist file doesn't exist
  - 💡 **Fallback**: Improved home activation script with better error handling
  - ⚡ **Performance**: Added `vim.schedule()` for non-blocking wordlist updates
  - 🐛 **Bug Fix**: Re-enabled `programmingWordlist.enable = true` with proper
    automation
  - 🎯 **User Experience**: Eliminates the manual `:DirtytalkUpdate` prompt
    mentioned in previous changelog
  - 📚 **Resolves**: The issue referenced in changelog line 81-83 where users
    had to manually run the command

- 🔧 **NeoVIM LSP Enhancement**: Enhanced Nix LSP configuration for better
  development experience
  - 🎯 **Purpose**: Enables automatic evaluation of Nix inputs for better LSP
    functionality
  - 📍 **Location**: Added nil LSP configuration with auto-eval-inputs in
    luaConfigPost
  - 🚀 **Benefits**:
    - 💡 Better code completion for Nix files
    - 🔍 Enhanced error checking and navigation
    - 🧠 Improved IntelliSense for Nix expressions
  - ⚙️ **Configuration**: Added `auto-eval-inputs = true` for nil LSP server

#### 📅 **Updated: August 10th, 2025**

- ⚡ **ZCLI Enhancement**: Added `rebuild-boot` function to `zcli`
  - 🔄 Uses `nh os boot` instead of `nh os switch`
  - ⏭️ Configuration activates on next restart instead of immediately
  - 🛡️ Safer for kernel updates, driver changes, and system-critical
    modifications
  - 📝 Added to help menu with proper documentation

- 🐛 **Bug Fix**: Fixed typo in `detect_gpu_profile()` function
  - 🔧 Corrected `detec0.1ted_profile` to `detected_profile`
  - ✅ GPU auto-detection for hybrid systems now works properly

- 📝 **Documentation**: Improved formatting in `ZaneyOS-Upgrade.md`
  - 🔧 Fixed incomplete sentence about `zcli rebuild-boot` command availability
  - ✨ Improved bullet point clarity and sub-bullet indentation
  - 🎨 Fixed code block formatting in migration steps
  - 📋 Removed unnecessary quote markers from bash commands

#### 📅 **Updated: August 7th, 2025**

- 📊 **Waybars**: Added new waybars
  - ➕ `waybar-dwm.nix`
  - ➕ `waybar-dwm-2.nix`
    - 🎨 Source waybar code by Matt @TheLinuxCast

- 🔧 **NIX Formatting**:
  - Reformatted NIX to NIX formatting standard

- 🎮 **ZFS Support**: Added `hostID` to `variables.nix` and `network.nix`
  - 💾 This is needed by ZFS
  - 👏 Thanks to Daniel Emeery for the patch

- 📝 **Documentation**: Added `tealdeer.nix (TLDR)` with autoupdate

- 🔧 **ZCLI Fixes**:
  - ➕ Added defensive code to `zcli.nix`
  - 🔍 For rebuilds, updates, hostname and flake host mistches are checked
  - ⚙️ If not same, prompted to auto update the flake.nix
  - 💼 Added `$PROJECT` variable to set repo location
  - 📝 Default is `zaneyos`
  - 📊 Added info on `zcli` utility
  - ⬆️ Updated `zcli` now uses `nh` util to select # of generations to keep
  - ➕ Added `zcli` CLI util. runs rebuild, update, garbage collection and diags
  ```text
  ❯ zcli

  ZaneyOS CLI Utility -- version 1.0

  Usage: zcli [command]

  Commands:

  rebuild - Rebuild the NixOS system configuration. update - Update the flake and
  rebuild the system. update-host - Auto-set host and profile in flake.nix.

  add-host - Add a new host configuration. del-host - Delete a host configuration.

  list-gens - List user and system generations. cleanup - Clean up old system
  generations. trim - Trim filesystems to improve SSD performance. diag - Create a
  system diagnostic report.

  help - Show this help message.
  ```

- 🔧 **QT Fixes**:
  - 🔄 Update `qt.nix` and `stylix.nix` to `PlatformTheme = "qtct"`
  - ⚠️ In unstable `gnome` is now `adwaita` both cause eval warnings
  - ⚙️ Setting `qtct` in `qt.nix` now to prevent this issue later
  - 🔧 Fixed formatting issue in install script

- 📝 **NeoVim/NVF Updates**:
  - 🐛 Change in `nvf` update prompts you to d/l wordlist ever time
    - enter `:DirtytalkUpdate` case sensitive to resolve
  - 🔗 `https://github.com/NotAShelf/nvf/pull/991`
  - ✅ Re-enabled `css` formatting in `nvf.nix` Thx `mister_simon` for fix

- 🤖 **AI Tools**: (Clients only)
  - ♊️ Added `gemini-cli` Supports `gemini-pro/flash`
  - 🛠️ Added `aider chat` Supports many LLMs
  - 📝 Added `claude-code` Supports `claude LLMs`
  - 🚀 Added `warp terminal` Support multiple LLMs

- 🦇 **Bat/Theme Updates**:
  - 🎨 Set Dracula theme to `bat` command
  - ➕ Added `style = all` and set `man` pager to `bat`

- 🎧 **Audio**:
  - Added `low latecny` setting for `pipewire`

- 📊 **System Monitoring**:
  - Added custom config for `btm` htop like cli util

- 🔧 **Terminal Fixes**:
  - ➕ Added workaround for issue where `ghostty` is slow or hangs
  - ➕ Added electron ozone env variable to `hint`

- 🎥 **OBS Studio**:
  - Added `obs-studio.nix`
  - To allow for customization added common plugins

- 📺 **TMUX**:
  - Updated `tmux.nix` adding popups for lazygit, terminal, edit menu

- 📜 **Install Script**:
  - Improved `install-zaneyos.sh` script Detects GPU and better presentation

- 📝 **Evil Helix**:
  - Added `evil-helix` with language support as option

- 💻 **VSCode Updates**:
  - 🔄 `vscode` update
  - ➕ Added `vscode.nix` with plugins for NIX, BASH, JSON, and VIM keybinds
  - 👏 Thanks to `delciak` for providing the NIX code for `vscode.nix`
  - ➕ Added variable 'enableVscode' in the `hosts/default/variables.nix`

## 🔧 **Additional Improvements and Fixes**:

- ⚙️ **Variables**:
  - Added vars for `alacritty` `ghostty` `tmux` `wezterm` in `variables.nix`

- 🖥️ **Display Manager**:
  - Added variable `displayManager` in `hosts/hostname/variables.nix`
    - ✨ Set to `sddm` will enable SDDM login manager themed by stylix
    - 💻 Set to `tui` and you get the greetd text login as before

- 🔧 **Scripts**:
  - `hm-find` script to detect HomeMgr backup files, wasn't imported

- 📈 **Version**:
  - Updated version to v2.3.3

- 🖥️ **Wayland**:
  - Added `uwsm` package, disabled by default in Hyprland
- ⭐ **Starship**:
  - Added alternate `starship` config. `starship-ddubs-1.nix`
- 📚 **Documentation**:
  - Added more info in `hosts/default/variables.nix`
  - 📋 Listing available terminals, stylix images, waybars
  - 📐 Added more info on how to configure monitors

- 🌈 **Colorful Waybar**:
  - Added new waybar from `swordlesbian` Very colorful and bright

- 🔐 **SDDM**:
- Added `sddm.nix` themed with stylix
- Moved login dialog to left
- Styled with better colors

- 🖼️ **Theming**:
  - Set default stylix image to `mountainscapedark.png`
  - 🎨 Provides warmer colors and super nice SDDM background

- 📝 **Fonts**:
  - Added more fonts to `modules/core/fonts.nix`

- 📱 **Terminal**:
  - Added `alacritty` terminal with `Maple MF` font

- 📦 **Flatpak**:
  - Redid `flatpak.nix`
  - You add your flatpak apps there
  - They get installed/updated during next rebuild
  - If you remove it, they flatpak app will be uninstalled on next rebuild

- ✅ **Formatter**:
- Re-enabled `language formatter` had to disable `css` formatter for now

## 🔀 **Git Enhancements**:

- ➕ **Aliases**: Added three git aliases `com`, `gs`, and `gp`
  - 💬 `git com` will run `git commit -a`
  - 📦 `git gs` will run `git stash`
  - ⬇️ `git gp` will run `git pull`

## 📝 **Editor Improvements**:

- ✅ **Default Editor**:
  - Enabled `neovim` in `packages.nix` to set it to `defaultEditor`
- 🔄 **Relative Numbers**:
  - Restored relative line numbering to nvim `lineNumberMode = "relNumber";`
- ➖ **Cleanup**:
  - Removed extraneous LUA code for diags w/debug messages from `nvf.nix`
- 🔄 **LSP Changes**:
  - NVIM `languages.enableLSP` changed to `vim.settings.lsp.enable`
- 📋 **Clipboard**:
  - Updated `nvf.nix`to use a clipboard provider as `useSystemClipobard` is no
    longer supported
- 🩺 **Diagnostics**:
  - Restored diagnostic messages inline as errors are detected
- 💾 **Hints**:
  - When you save a file the LSP will show any applicable hints

## 📁 ** EZA enhancements **:

- 🔄 **Organization**: Moved `eza` aliases to `eza.nix`
- 🐚 **Shell Integration**: Enabled `bash`,`zsh`, `fish` integration in
  `eza.nix`
- 🌍 **Consistency**: All supported shells aliases are now set in `eza.nix`
- 🗑️ **Cleanup**: Removed `eza` aliases from `zsh/default.nix` and `bash.nix`
- ⚙️ **Defaults**: Set default options for `eza` in `eza.nix`

## 🔧 **System Fixes & Updates**:

- 🔧 **Git Command**: git command is install script missing `clone` keyword
- ❌ **GPU Fix**: Commented out AQ_DRM_DEVICES ENV variable. Can break config
  with more than two GPUs
- ✏️ **Docs**: spelling corrections in README.md
- 🔗 **Clone**: Updated clone command in README.md to grab 2.3 stable branch
- 🖥️ **VM Display**: Updated `hyprland.nix` to set VMs `Virtual-1` monitors to
  1920x1080@60
- 🔐 **SSH**: Disabled root login for SSH
- 👥 **Access**: Users allowed password SSH access
- 🔀 **Git Features**: Added features and aliases to `git` command

## 🐚 **ZSH Configuration**:

- 🔄 Modified zsh config

```nix
 syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "regexp" "root" "line"];
    };
    historySubstringSearch.enable = true;

    history = {
      ignoreDups = true;
      save = 10000;
      size = 10000;
    };
```

## 🛠️ **Utility Enhancements**:

- 🎨 **LazyGit**: Added `lazygit.nix` to theme, customize lazygit util
- 🔍 **FZF**: Added `fzf.nix` to customize fzf util
  - 👁️ Added preview to `fzf.nix` Enter to edit
- ➖ **Cleanup**: Removed lazygit from core packages now in lazygit.nix

## 📊 **Waybar & UI Updates**:

- ➕ **Jerry's Waybar**: Added `waybar-ddubs-2.nix` Modified ver of Jerry's
  waybar
- 🎨 **Colors**: Adjusted some colors in Jerry's waybar
- ➕ **Options**: Added Jerry's waybar as option. `Jerry-waybar.nix`
- ✨ **Blur**: Added option to enable blur on waybar on `hyprland.nix` Thx
  SchotjeChrisman

## 🖥️ **Hyprland Improvements**:

- ✨ **Animations**: Added new animation `animation-moving`from ML4W repo
- 🔧 **Regression Fix**: Fixed regression in `windowrules.nix`
- 🎨 **Stylix**:
- Stylix was set to unstable - set to 25.05 to stop warning
- ⚙️ **ENV Variables**:
  - Hyprland ENV variables were set in two files previously
  - Created `env.nix` to move them to a single file
- 🗑️ **Cleanup**: Hyprland animation files had unneeded `inherit`statements
- 📐 **Terminal Size**: Pyprland drop down terminal size changed from 75% to 70%
- 🚫 **Donations**: Disabled Hyprland donation messages
- ⚙️ **ANR Threshold**:
  - Set Application Not Responding (ANR) dialog threshold to 20
  - The default threshold of one was too sensitive
  - It would trigger on many apps like `waypaper`

## 🏗️ **System Architecture**:

- 📌 **Version Pin**: Pinned nixpkgs and homemanager to 25.05 in `flake.nix`
- 🔄 **Lock Update**: Updated `flake.lock`to match changes
- ⬆️ **Hyprland**: Hyprland updated to v0.49

- 🔧 **Bug Fixes**:
  - Fixed syntax error in `animations-dynamic.nix`file. Thx Brisingr05
- 🔐 **Lock Fix**:
  - Added `hyprlock.enable=true;` in system packages
  - This resolves issue with PAM auth errors
- 🗑️ **Cleanup**: Removed unneeded `home.mgr.enable` in `user.nix` Thx
  Brisingr05

## 📖 **Documentation & Fixes**:

- ❌ **Disk Module**: Disabled the `df` command in the disk module. Doesn't work
  w/zaneyos
- 📋 **Monitor Examples**: Added examples for monitor setup in `variables.nix`
- 🔧 **Yazi Fix**: Merged yazi fix for errors after rebuilds. Thank you Daniel
- 🔄 **Flake Update**: Updated flake 05/27/2025
- 📚 **FAQ Updates**: Updated `FAQ.md` with Hyprland Keybinds and how to change
  waybar
- 📖 **README**: Updated `README` with Hyprland keybinds
- 📜 **Install Script**: Updated install script to pull from the most current
  release not the main branch
- 🔍 **Backup Files**: Added `hm-find` to find old backup files preventing
  rebuilds/updates from completing
- 🐛 **Yazi Error**: Added how to fix yazi startup error to `FAQ.md`
- 🎨 **FAQ Format**: Fixed formatting in `FAQ.md` causing yazi info from being
  hidden

---

# 📚 **Version History**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<details>

<summary><strong>v2.3 GA Release Notes</strong></summary>

<div style="margin-left: 20px;">

- With this release there are improvements to Neovim
- The entire file structure has been improved.
- Switched from `nixvim` to `nvf` for neovim configuration.
- Improved `bat` config and includes extras now.
- Added profiles for what kind of system you have based of GPU / VM.
- Reduced the host specific files and made the entire flake more modular.
- Fixed git getting set to wrong user settings.
- Fixed hyprlock conflicting with stylix.
- Setup`nh` in a better fashion.
- Added support for `qmk` out of the box.
- Added `usbutils` for lsusb functionality.
- Massive improvement to Hyprland window rules.
- Removed broken support for Apple Silicon (this may return).
- Install script improved.
- Fixed `nix flake check` not working.
- Added nvidia prime PCI ID variables to host `variables.nix`.
- Added vim keybindings zsh (alt+hjkl).
- Added (ctrl+hjkl) keybinds for vim movement while in insert mode in neovim.
- Supports adb out of the box.
- Ddubs/dwilliam62 helped with the addition of pyprland and scratchpad support.
  He is now also a maintainer.
- Can now summon a drop-down terminal with `SUPER, T`.
- Added image used by Stylix into the host variables file.
- Made printing and NFS variables so they can be easily toggled between hosts.
- Added waybar styling choice.
- Kitty, Wezterm, Neovim/nvf, and even Flatpaks all properly themed with Stylix.
- Moved to hyprpolkitagent and fixed qt theming.
- Stylix options that I wanted forced us back on the unstable branch.
- Made Thunar an optional thing, enabled by default. _But for me Yazi is
  enough._

  </div>

  </details>

<br>
<details>
<summary><strong>**ZaneyOS v2.2**</strong> </summary>

<div style="margin-left: 20px;">

- This release has a big theming change
- Move back to rofi. It is a massive improvement in many ways.
- Revert the switch from rofi to wofi. Rofi is just better.
- Switch from Nix Colors to Stylix. It can build colorschemes from a wallpaper.
- Simplified the notification center.
- Improved emoji selection menu and options.
- Adding fine-cmdline plugin for Neovim.
- Removed theme changing scripts as the theme is generated by the image set with
  stylix.image in the config.nix file.
- Starship is now setup in the config.nix file.
- Switched from SDDM to tuigreet and greetd.
- Added Plymouth for better looking booting.
- Improve the fonts being installed and properly separate them from regular
  packages.
- Separated Neovim configuration for readability.
- Updated flake and added fix for popups going to wrkspc 1 in Hyprland.
- Removed a few of the packages that aren't necessary and smartd by default.
- Removed unnecessary Hyprland input in flake as home manager doesn't use it.
- Turned off nfs by default.
- Hyprland plugins are now disabled in the config by default.
- Fastfetch is now replacing neofetch.
- Btop is back baby!
- Switching to Brave as the default to protect user privacy.
- Replaced lsd with eza for a better looking experience.

</div>

</details>
<br>

<details>

<summary><strong>**ZaneyOS v2.1**</strong></summary>

<div style="margin-left: 20px;">

Simple bug fixes.

- Fixed Waybar icons to make them look a bit better.
- Centered the Wofi window always.
- Should have fixed some Steam issues, but I have had some crashes due to Steam
  so be aware of that.
- The flake got an update, so all the packages are fresh.

</div>

</details>

<br>

<details>

<summary><strong>**ZaneyOS v2.0** </strong></summary>

<div style="margin-left: 20px;">

With this new update of ZaneyOS it is a big rewrite of how things are being
done. This update fixes many issues that you guys were facing. As well as makes
things a little easier to understand. You now have a lot being stored inside the
specific host directory, making use of modules, condensing seperate files down,
etc. My hope is that with this update your ability to grasp the flake and expand
it to what you need is much improved. I want to thank everyone for being so
supportive!

- Most configuration put into specific hosts directories for the best
  portability.
- Using modules to condense configuration complexity.
- Simplified options and the complexity around understanding their
  implementation.
- Rewrote the documentation for improved readability.

</div>

</details>
