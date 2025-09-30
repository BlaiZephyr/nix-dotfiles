[English](zcli.md) | [Español](zcli.es.md)

# ZaneyOS Command Line Utility (zcli) - Version 1.0.2

zcli is a handy tool for performing common maintenance tasks on your ZaneyOS
system with a single command. Below is a detailed guide to its usage and
commands.

## Usage

Run the utility with a specific command:

`zcli`

If no command is provided, it displays this help message.

## Available Commands

Here’s a quick reference table for all commands, followed by detailed
descriptions:

|| Command       | Icon | Description                                                                                                                                           | Example Usage                           |
|| ------------- | ---- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
|| cleanup       | 🧹   | Removes old system generations, either all or by specifying a number to keep, helping free up space.                                                  | `zcli cleanup` (prompted for all or #)  |
|| diag          | 🛠️   | Generates a system diagnostic report and saves it to `diag.txt` in your home directory.                                                               | `zcli diag`                             |
|| list-gens     | 📋   | Lists user and system generations, showing active and existing ones.                                                                                  | `zcli list-gens`                        |
|| rebuild       | 🔨   | Rebuilds the NixOS system configuration by checking for files that might prevent Home Manager from rebuilding.                                        | `zcli rebuild [options]`                |
|| rebuild-boot  | 🔄   | Rebuilds NixOS configuration for next boot (activates on restart) - safer for major changes.                                                         | `zcli rebuild-boot [options]`           |
|| trim          | ✂️   | Trims filesystems to improve SSD performance and optimize storage.                                                                                    | `zcli trim`                             |
|| update        | 🔄   | Updates the flake, checks for potential conflicts that might prevent Home Manager from rebuilding, and then rebuilds the system.                      | `zcli update [options]`                 |
|| update-host   | 🏠   | Automatically sets the host and profile in your `flake.nix` file based on the current system. It detects the GPU type or prompts for input if needed. | `zcli update-host [hostname] [profile]` |
|| add-host      | ➕   | Creates a new host configuration by copying the default template and setting up hardware detection.                                                   | `zcli add-host [hostname] [profile]`    |
|| del-host      | ➖   | Removes an existing host configuration directory and files.                                                                                           | `zcli del-host [hostname]`              |
|| doom install  | 🔥   | Installs Doom Emacs using the automated get-doom script with all required packages.                                                                  | `zcli doom install`                     |
|| doom status   | ✅   | Checks if Doom Emacs is installed and shows version information.                                                                                     | `zcli doom status`                      |
|| doom remove   | 🗑️   | Completely removes Doom Emacs installation (with safety confirmation).                                                                               | `zcli doom remove`                      |
|| doom update   | 🔄   | Updates Doom Emacs packages and configuration via doom sync.                                                                                         | `zcli doom update`                      |

## Advanced Build Options

The `rebuild`, `rebuild-boot`, and `update` commands now support advanced options for enhanced control:

| Option | Short | Description | Example |
|--------|-------|-------------|----------|
| `--dry` | `-n` | Preview mode - shows what would be done without executing | `zcli rebuild --dry` |
| `--ask` | `-a` | Interactive confirmation prompts for safety | `zcli update --ask` |
| `--cores N` | | Limit build operations to N CPU cores (useful for VMs) | `zcli rebuild --cores 4` |
| `--verbose` | `-v` | Enable verbose output for detailed operation logs | `zcli update --verbose` |
| `--no-nom` | | Disable nix-output-monitor for traditional output | `zcli rebuild --no-nom` |

### Usage Examples

```bash
# Preview what an update would do without actually doing it
zcli update --dry

# Rebuild with confirmation prompts and verbose output
zcli rebuild --ask --verbose

# Limit rebuild to 2 cores (great for VMs or low-power systems)
zcli rebuild --cores 2

# Combine multiple options
zcli update --dry --verbose --cores 4
```

## Detailed Command Descriptions

### System Management

- **🧹 cleanup**: This command helps manage system storage by removing old
  generations. You can remove all generations or specify a number to retain
  (e.g., `zcli cleanup` free's up space and removes the entries from boot menu.

- **🛠️ diag**: Creates a comprehensive diagnostic report by running
  `inxi --full` and saving the output to `diag.txt` in your home directory. This
  is ideal for troubleshooting or sharing system details when reporting issues.

- **📋 list-gens**: Displays a clear list of your current user and system
  generations, including active ones. This allows you to review what's installed
  and plan cleanups.

- **🔨 rebuild**: Performs a system rebuild for NixOS by first checking for any
  files that could block Home Manager from completing the process. Now supports
  advanced options for dry runs, confirmation prompts, and performance tuning.

- **🔄 rebuild-boot**: Similar to rebuild but sets the configuration for next boot
  instead of immediate activation. This is safer for major system changes, kernel
  updates, or when you want to test changes after a reboot. Configuration becomes
  active only after restarting.

- **✂️ trim**: Optimizes your filesystems, particularly for SSDs, to improve
  performance and reduce wear. Run this regularly as part of your maintenance
  routine.

- **🔄 update**: Streamlines updates by checking for potential issues with Home
  Manager, then updating the flake and rebuilding the system. This combines
  flake updates and rebuilds into one efficient step. Supports all advanced build options.

### Host Management

- **🏠 update-host**: Simplifies managing multiple hosts by automatically
  updating the `hostname` and `profile` in your `~/zaneyos/flake.nix` file. It
  attempts to detect your GPU type; if it fails, you'll be prompted to enter the
  details manually.

- **➕ add-host**: Creates a new host configuration by copying the default template
  and setting it up for your specific system. Automatically detects GPU profile
  and can generate hardware.nix. Prompts for confirmation on GPU detection and
  hardware generation.

- **➖ del-host**: Safely removes an existing host configuration directory and all
  associated files. Includes confirmation prompt to prevent accidental deletion.

### Doom Emacs Management

- **🔥 doom install**: Installs Doom Emacs using the automated get-doom script.
  This includes cloning the Doom Emacs repository, running the installation, and
  performing initial sync. All required packages are handled automatically.

- **✅ doom status**: Checks if Doom Emacs is properly installed and displays
  version information. Useful for verifying installation or troubleshooting.

- **🗑️ doom remove**: Completely removes Doom Emacs installation including all
  configuration files. Includes safety confirmation to prevent accidental removal.

- **🔄 doom update**: Updates Doom Emacs packages and configuration by running
  `doom sync`. This ensures all packages are up-to-date and configurations are
  properly applied.

## Additional Notes

- **Why use zcli?** This utility saves time on routine tasks, reducing the need
  for multiple commands or manual edits. The advanced options provide fine-grained
  control over system operations.

- **Version and Compatibility:** Ensure you're using the latest version (1.0.2
  as per the source). For any issues, generate a diagnostic report with
  `zcli diag` and consult your system logs.

- **Safety Features:** The new `--dry` option allows you to preview changes before
  applying them, while `--ask` provides interactive confirmation for critical operations.

- **Performance Tuning:** Use `--cores` to limit CPU usage during builds, especially
  useful in virtual machines or systems with limited resources.

- **Doom Emacs Integration:** The built-in Doom Emacs management eliminates the need
  for manual installation and configuration, providing a streamlined experience for
  this popular Emacs distribution.
