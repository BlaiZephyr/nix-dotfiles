[English](UPGRADE-2.3-to-2.4.md) | [Español](UPGRADE-2.3-to-2.4.es.md)

# ZaneyOS 2.3 → 2.4 Upgrade Guide

This guide provides safe upgrade scripts to migrate from ZaneyOS 2.3 to 2.4, handling all the breaking changes and ensuring your custom configuration is preserved.

## 🔄 Major Changes in 2.4

- **SDDM** is now the default display manager (was previously tui-greetd)
- **Terminal Selection**: Individual terminal applications can be enabled/disabled
- **New Variables**: Additional configuration variables added to `variables.nix`
- **Breaking Changes**: Direct upgrade causes build failures due to missing variables

## 📋 What the Upgrade Script Does

1. **Pre-Upgrade Analysis**: Comprehensive analysis of your current configuration with detailed report
2. **Full Backup**: Creates complete backup of your current system
3. **Version Verification**: Confirms you're running ZaneyOS 2.3
4. **Safe Upgrade**: Switches to main branch (2.4) and merges configurations
5. **Variable Merging**: Automatically migrates all your settings to new format
6. **Terminal Handling**: Ensures your preferred terminal is enabled in 2.4
7. **Safe Build**: Uses `boot` option to avoid SDDM display issues
8. **Revert Option**: Provides easy rollback if anything goes wrong

## 🛡️ Safety Features

- **Complete Backup**: Full copy of your zaneyos directory before any changes
- **Boot vs Switch**: Uses safe boot option to prevent display manager conflicts
- **Revert Function**: Can completely restore 2.3 backup with one command
- **Validation**: Checks system state before proceeding
- **Logging**: Comprehensive log file for troubleshooting

## 🚀 How to Upgrade

### Step 0: Get the upgrade script safely (do NOT git pull yet)

To avoid overwriting your local configuration before a backup is created, fetch just the upgrade script without modifying your working tree.

Option A — Using your existing git remote (recommended):
```bash
# Fetch the latest refs without touching your working tree
git -C ~/zaneyos fetch origin

# Write the script from origin/main into your home directory
git -C ~/zaneyos show origin/main:upgrade-2.3-to-2.4.sh > ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```

Option B — Using curl (if you don't have a usable origin remote):
```bash
curl -fsSL https://gitlab.com/zaney/zaneyos/-/raw/main/upgrade-2.3-to-2.4.sh -o ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```

Both methods keep your local repo unchanged. The script will create a full backup before switching branches.

### Step 1: Run the Upgrade Script

```bash
# You can run the script from anywhere; it operates on ~/zaneyos
~/upgrade-2.3-to-2.4.sh
```

### Step 2: Review the Pre-Upgrade Analysis

The script will first perform a comprehensive analysis of your current configuration:
- **Analyze flake.nix** for custom inputs and current profile
- **Scan all host configurations** and detect customizations
- **Check global packages** in modules/core/packages.nix
- **Detect shell customizations** (zsh, bash, eza personal files)
- **Identify other custom modules** and personal files
- **Generate a detailed report** saved as `~/zaneyos-upgrade-analysis-TIMESTAMP.txt`

**The analysis will clearly show:**
- ✅ **What WILL be automatically migrated** (variables, packages, configs)
- ⚠️ **What requires manual attention** (custom inputs, personal shell files)
- 📋 **Summary of all hosts and customizations** found

### Step 3: Follow the Prompts

After reviewing the analysis, the script will:
- Create a backup (you'll see the location)
- Ask for confirmation before proceeding
- Download ZaneyOS 2.4 from main branch
- Merge your configuration automatically
- Build the new system
- Prompt for reboot

### Step 4: Reboot Your System

After successful build:
```bash
sudo reboot
```

Your system will now boot with:
- SDDM as the login manager
- All your previous settings preserved
- New 2.4 features available

## 🔧 Configuration Migration Details

### Automatically Preserved Settings:
- Git username and email
- Browser preference
- Terminal choice (with automatic enabling)
- Keyboard layout and console keymap
- NFS, printing, and Thunar settings
- Clock format (12h/24h)
- Monitor settings
- Wallpaper (stylixImage)
- Waybar theme choice
- Animation settings
- Hardware configuration
- **Global packages** (modules/core/packages.nix customizations)
- **Host-specific packages** (hosts/[hostname]/host-packages.nix)
- **Custom module imports** (hosts/[hostname]/default.nix if customized)

### Terminal Handling:
If you were using a specific terminal in 2.3:
- **Kitty**: Already enabled by default in 2.4
- **Alacritty**: Script automatically enables `alacrittyEnable = true`
- **WezTerm**: Script automatically enables `weztermEnable = true`
- **Ghostty**: Script automatically enables `ghosttyEnable = true`

## ⚠️ Important Notes

### SDDM Display Manager
- 2.4 uses SDDM as default login manager
- The upgrade uses `boot` instead of `switch` to prevent display issues
- You **must reboot** after upgrade - don't use `switch` command

### Backup Location
Your backup is stored at:
```
~/.config/zaneyos-backups/zaneyos-2.3-upgrade-backup-TIMESTAMP/
```

## 🔄 How to Revert

If you encounter any issues, you can easily revert:

### Option 1: Use the Revert Script
```bash
cd ~/zaneyos
./revert-to-2.3.sh
```

### Option 2: Use the Main Script
```bash
cd ~/zaneyos
./upgrade-2.3-to-2.4.sh --revert
```

### Option 3: Manual Revert
1. Remove current zaneyos directory: `rm -rf ~/zaneyos`
2. Restore from backup: `cp -r ~/.config/zaneyos-backups/[backup-name]/zaneyos ~/`
3. Rebuild system: `nh os boot ~/zaneyos --hostname [profile]`
4. Reboot system

## 🔍 Troubleshooting

### Build Failures
- Check the log file (location shown in script output)
- Ensure you have sufficient disk space
- Try the revert option and report the issue

### Display Issues After Reboot
- If you get a blank screen, wait a few moments for SDDM to start
- You can switch to TTY (Ctrl+Alt+F2) if needed
- Login and run `systemctl status display-manager`

### Missing Applications
- Check if your preferred terminal is enabled in `~/zaneyos/hosts/[hostname]/variables.nix`
- Verify browser and other applications are still available
- Some applications may need to be re-enabled in the new configuration

### Log File Location
Each run creates a log file at: `~/zaneyos-upgrade-TIMESTAMP.log`

## 📁 File Structure After Upgrade

Your host configuration will be updated with new 2.4 structure:
```
~/zaneyos/hosts/[your-hostname]/
├── hardware.nix          (preserved from 2.3)
└── variables.nix         (updated to 2.4 format with your settings)
```

## 🆘 Emergency Recovery

If something goes very wrong:
1. Your complete 2.3 backup is preserved
2. Boot from NixOS live USB if needed
3. Mount your system and restore the backup
4. All your data and configuration is safe

## ✅ Post-Upgrade Checklist

After successful upgrade and reboot:
- [ ] SDDM login screen appears
- [ ] Desktop environment loads correctly
- [ ] Preferred terminal opens and works
- [ ] Browser launches correctly
- [ ] Custom wallpaper/theme preserved
- [ ] Monitor configuration correct
- [ ] All needed applications available

## 🤝 Getting Help

If you encounter issues:
1. Check the log file for error details
2. Try the revert option to restore 2.3
3. Report issues with log file contents
4. Your backup is always available for manual recovery

---

## Script Files

- **`upgrade-2.3-to-2.4.sh`** - Main upgrade script
- **`revert-to-2.3.sh`** - Simple revert wrapper
- **`UPGRADE-2.3-to-2.4.md`** - This documentation

Remember: The upgrade creates a complete backup before making any changes, so your system is always recoverable.
