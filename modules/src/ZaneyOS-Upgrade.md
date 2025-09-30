[English](ZaneyOS-Upgrade.md) | [Español](ZaneyOS-Upgrade.es.md)

# 🚀 ZaneyOS Upgrade Procedure

## ⚠️ DEPRECATED - Use New Automated Upgrade System

> **IMPORTANT:**
>
> This manual upgrade procedure has been **replaced** by a much safer and more comprehensive automated upgrade system.
>
> **Please use the new upgrade system instead:**
> - See: `UPGRADE-2.3-to-2.4.md` for complete documentation
> - Run: `./upgrade-2.3-to-2.4.sh` for automated upgrade
> - The new system includes automatic backups, variable migration, and easy revert options

---

## 🆕 New Automated Upgrade System

The new upgrade system provides:
- **Complete backup** of your current system before any changes
- **Automatic variable migration** from 2.3 to 2.4 format (handles 15+ variables)
- **Terminal dependency handling** (critical for 2.4 compatibility)
- **Safe build process** using `boot` instead of `switch` to avoid display issues
- **One-command revert** if anything goes wrong
- **Comprehensive logging** for troubleshooting

### Quick Start:
```bash
# Safely obtain the script without modifying your repo
git -C ~/zaneyos fetch origin && \
  git -C ~/zaneyos show origin/main:upgrade-2.3-to-2.4.sh > ~/upgrade-2.3-to-2.4.sh && \
  chmod +x ~/upgrade-2.3-to-2.4.sh

# Run the script (it will create a full backup before changing branches)
~/upgrade-2.3-to-2.4.sh
```

Alternative (curl):
```bash
curl -fsSL https://gitlab.com/zaney/zaneyos/-/raw/main/upgrade-2.3-to-2.4.sh -o ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
~/upgrade-2.3-to-2.4.sh
```

### For detailed instructions:
```bash
less UPGRADE-2.3-to-2.4.md
```

---

## ⚠️ Why Use the New System?

The manual process below is **incomplete and risky** because:
- ❌ Only handles 6 variables (actual 2.4 has 15+ new variables)
- ❌ No automatic backup system
- ❌ No terminal dependency handling
- ❌ No revert option if things go wrong
- ❌ Missing critical variables like `doomEmacsEnable`, monitor settings, theme configuration
- ❌ References outdated commands (`fr`, `fu` instead of `zcli`)

---

# 📜 Original Manual Procedure (DEPRECATED)

> **⚠️ WARNING: This manual procedure is outdated and incomplete.**
> **Use the automated upgrade system above instead.**

---

### 1. 📝 Prepare for Upgrade

1. **Ensure your current ZaneyOS is up-to-date:**
   - Navigate to your ZaneyOS directory:
     ```bash
     cd ~/zaneyos
     ```
   - If you have any uncommitted changes, commit and push them.
   - Fetch the latest changes:
     ```bash
     git stash && git fetch && git pull
     ```
   - Verify that your current host and GPU in `flake.nix` match your system.
     - You can edit `flake.nix` manually.
     - Depending on your current build, you might be able to run
       `zcli update-host`.
   - If there are any changes, perform a rebuild and reboot:
     - Use `fr` or `zcli rebuild`.

2. **Backup your current ZaneyOS directory:**
   ```bash
   mv ~/zaneyos ~/zaneyos-backup
   ```

3. **Clone the v2.4 branch:**
   ```bash
   git clone https://gitlab.com/zaney/zaneyos.git -b Stable-2.4 --depth=1
   cd ~/zaneyos
   ```

---

### 2. 🔄 Converting v2.3 Hosts to v2.4

ZaneyOS v2.4 introduces new features in the host configuration, giving you more
control. This requires a manual update to your host files.

- **New options in `hosts/hostname/variables.nix`:**

  ```nix
  # Set Display Manager: `tui` for Text, `sddm` for graphical GUI
  # SDDM background is set with stylixImage
  displayManager = "sddm";

  # Enable/disable bundled applications
  tmuxEnable = false;
  alacrittyEnable = false;
  weztermEnable = false;
  ghosttyEnable = false;
  vscodeEnable = false;
  helixEnable = false;
  ```

- **Migration Steps:**

  1. **Copy the `default` host template** to a new directory named after your
     host:
     ```bash
     # Replace YOURHOSTNAME with your actual hostname
     cp -r ~/zaneyos/hosts/default ~/zaneyos/hosts/YOURHOSTNAME
     ```
     _Example:_ If your hostname is `nixos`:
     ```bash
     cp -r ~/zaneyos/hosts/default ~/zaneyos/hosts/nixos
     ```

  2. **Copy the hardware configuration** from your backup:
     ```bash
     # Replace nixos with your hostname if different
     cp ~/zaneyos-backup/hosts/nixos/hardware.nix ~/zaneyos/hosts/nixos/hardware.nix
     ```

  3. ❗ **IMPORTANT:** In the `zaneyos` directory, stage your changes:
     ```bash
     git add .
     ```

  4. **Manually edit your new host files** (`~/zaneyos/hosts/YOURHOSTNAME`) to
     include any personal customizations (e.g., monitor settings, extra
     packages).
     > ⚠️ **Warning:** Do **NOT** copy/restore your old host files directly! You
     > must integrate your changes into the new v2.4 file structure.

---

### 3. ✅ Test the Configuration

1. **Verify `flake.nix`:** Ensure your hostname and GPU type are set correctly.
   - If you are unsure and your version has it available, run:
     `zcli update-host`

2. **Run a configuration check** from the `zaneyos` directory:
   ```bash
   nix flake check
   ```
   - If there are no errors, you can proceed to the final step.

---

### 4. ⬆️ Running the Upgrade

> ⚠️ **CRITICAL WARNING:**
>
> - Do **NOT** use `fr`, `fu`, or `zcli` for this final upgrade step.
> - Doing so will cause Hyprland to crash when the display manager (greetd or
>   SDDM) restarts during the switch.

1. **Execute the rebuild command** from the `zaneyos` directory:
   ```bash
   # Replace PROFILE with your GPU (e.g., amd, intel, nvidia, vm)
   sudo nixos-rebuild boot --flake .#PROFILE
   ```

2. **Reboot your system** once the update is complete.

---

### 🎉 Enjoy! Welcome to ZaneyOS v2.4!
