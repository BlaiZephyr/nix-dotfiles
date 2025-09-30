#!/usr/bin/env bash

##########################################
# ZaneyOS Upgrade Script: 2.3 → 2.4
# Author: Don Williams
# Date: $(date +"%B %d, %Y")
##########################################

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Define directories
ZANEYOS_DIR="$HOME/zaneyos"
BACKUP_BASE_DIR="$HOME/.config/zaneyos-backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$BACKUP_BASE_DIR/zaneyos-2.3-upgrade-backup-$TIMESTAMP"

# Target branch for 2.4 release (override by exporting BRANCH)
BRANCH="${BRANCH:-stable-2.4}"

# Define log file
LOG_FILE="$HOME/zaneyos-upgrade-$TIMESTAMP.log"

# Redirect all output to log file while still showing on screen
exec > >(tee -a "$LOG_FILE") 2>&1

# Function to print a section header
print_header() {
  echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${BLUE}║ ${1} ${NC}"
  echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════╝${NC}"
}

# Function to print an error message
print_error() {
  echo -e "${RED}❌ Error: ${1}${NC}"
}

# Function to print a warning message
print_warning() {
  echo -e "${YELLOW}⚠️  Warning: ${1}${NC}"
}

# Function to print a success message
print_success() {
  echo -e "${GREEN}✅ ${1}${NC}"
}

# Function to print an info message
print_info() {
  echo -e "${CYAN}ℹ️  ${1}${NC}"
}

# Function to create full backup
create_backup() {
    print_header "Creating Complete Backup"
    
    if [ ! -d "$ZANEYOS_DIR" ]; then
        print_error "ZaneyOS directory not found at $ZANEYOS_DIR"
        return 1
    fi
    
    print_info "Creating backup directory: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    
    print_info "Copying entire zaneyos directory..."
    if cp -r "$ZANEYOS_DIR" "$BACKUP_DIR/"; then
        print_success "Backup created successfully at: $BACKUP_DIR"
        echo -e "${GREEN}📁 Backup location: $BACKUP_DIR/zaneyos${NC}"
        return 0
    else
        print_error "Failed to create backup"
        return 1
    fi
}

# Function to revert from backup
revert_from_backup() {
    print_header "Reverting from Backup"
    
    if [ ! -d "$BACKUP_DIR/zaneyos" ]; then
        print_error "Backup not found at $BACKUP_DIR/zaneyos"
        echo -e "${YELLOW}Available backups:${NC}"
        ls -la "$BACKUP_BASE_DIR/" 2>/dev/null || echo "No backups found"
        return 1
    fi
    
    print_warning "This will completely restore your ZaneyOS 2.3 configuration"
    echo -e "${YELLOW}Current zaneyos directory will be replaced with backup${NC}"
    
    read -p "Are you sure you want to revert? (Y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Revert cancelled"
        return 1
    fi
    
    # Remove current directory
    print_info "Removing current zaneyos directory..."
    if [ -d "$ZANEYOS_DIR" ]; then
        rm -rf "$ZANEYOS_DIR"
    fi
    
    # Restore from backup
    print_info "Restoring from backup..."
    if cp -r "$BACKUP_DIR/zaneyos" "$HOME/"; then
        print_success "Successfully reverted to ZaneyOS 2.3 backup"
        
        # Change to the restored directory
        cd "$ZANEYOS_DIR" || return 1
        
        # Get the profile from flake.nix
        local profile=$(grep 'profile = ' ./flake.nix | sed 's/.*= *"\([^"]*\)".*/\1/')
        
        print_info "Rebuilding system with restored configuration..."
        if command -v nh &> /dev/null; then
            nh os boot ~/zaneyos --hostname "$profile"
        else
            sudo nixos-rebuild boot --flake ~/zaneyos/#"$profile"
        fi
        
        if [ $? -eq 0 ]; then
            print_success "System successfully reverted to ZaneyOS 2.3"
            echo -e "${YELLOW}Please reboot to complete the reversion${NC}"
        else
            print_error "Failed to rebuild system after revert"
            return 1
        fi
        
        return 0
    else
        print_error "Failed to restore from backup"
        return 1
    fi
}

# Function to print success banner
print_success_banner() {
  echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}║                 ZaneyOS 2.4 Upgrade Successful!                      ║${NC}"
  echo -e "${GREEN}║                                                                       ║${NC}"
  echo -e "${GREEN}║   🎉 Your system has been upgraded to ZaneyOS 2.4                    ║${NC}"
  echo -e "${GREEN}║   🔄 Please reboot your system for changes to take full effect       ║${NC}"
  echo -e "${GREEN}║   🖥️  SDDM is now the default display manager                         ║${NC}"
  echo -e "${GREEN}║                                                                       ║${NC}"
  echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════════════╝${NC}"
}

# Function to print failure banner
print_failure_banner() {
  echo -e "${RED}╔═══════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${RED}║                 ZaneyOS 2.4 Upgrade Failed!                          ║${NC}"
  echo -e "${RED}║                                                                       ║${NC}"
  echo -e "${RED}║   Please review the log file for details:                             ║${NC}"
  echo -e "${RED}║   ${LOG_FILE}                                                         ║${NC}"
  echo -e "${RED}║                                                                       ║${NC}"
  echo -e "${RED}╚═══════════════════════════════════════════════════════════════════════╝${NC}"
}

# Cleanup helper: remove duplicate attribute keys in variables.nix
cleanup_duplicates() {
  local file_path="$1"
  # Keep only the first non-comment occurrence of specific keys
  awk '
    BEGIN{si=0; ac=0; wc=0}
    /^[[:space:]]*stylixImage[[:space:]]*=/ { if (si++) next }
    /^[[:space:]]*animChoice[[:space:]]*=/ { if (ac++) next }
    /^[[:space:]]*waybarChoice[[:space:]]*=/ { if (wc++) next }
    { print }
  ' "$file_path" > "$file_path.tmp" && mv "$file_path.tmp" "$file_path"
}

# Prompt helpers for non-interactive mode
prompt_yes() {
  local message="$1"
  if [ "${AUTO_YES:-}" = "1" ]; then
    echo -e "$message Y"
    REPLY=Y
  else
    read -p "$message " -n 1 -r
    echo ""
  fi
}

prompt_choice() {
  # $1: prompt message, $2: default uppercase letter (e.g., S or R)
  local message="$1"
  local default_char="$2"
  if [ "${AUTO_YES:-}" = "1" ]; then
    echo -e "$message $default_char"
    choice="$default_char"
  else
    read -p "$message " -r choice
  fi
}

# Git helper: switch to target branch safely even with uncommitted changes
switch_to_main_handling_dirty() {
  # Fetch target branch from origin
  print_info "Fetching latest changes from origin ($BRANCH)..."
  # Fetch branch ref into FETCH_HEAD (works even if remote-tracking branch isn't configured)
  if ! git fetch origin "$BRANCH"; then
    print_error "Failed to fetch origin/$BRANCH"
    exit 1
  fi

  # Handle dirty worktree
  if ! git diff-index --quiet HEAD -- 2>/dev/null; then
    print_warning "UNCOMMITTED CHANGES DETECTED!"
    echo "You can:"
    echo "  • [S]tash changes (default)"
    echo "  • [D]iscard changes (reset hard)"
    echo "  • [A]bort upgrade"
    prompt_choice "Choose action [S/d/a]:" "S"
    case "${choice^^}" in
      D)
        print_warning "Discarding local changes (git reset --hard && git clean -fd)"
        git reset --hard || { print_error "git reset failed"; exit 1; }
        git clean -fd || { print_error "git clean failed"; exit 1; }
        ;;
      A)
        print_info "Upgrade cancelled by user due to uncommitted changes."
        exit 0
        ;;
      *)
        local stash_name="pre-upgrade-stash-$(date +%F_%H-%M-%S)"
        if git stash -u -m "$stash_name"; then
          print_success "Changes stashed as: $stash_name"
        else
          print_error "Failed to stash changes"
          exit 1
        fi
        ;;
    esac
  fi

  # Create or reset local branch to fetched commit (FETCH_HEAD)
  if ! git checkout -B "$BRANCH" FETCH_HEAD; then
    print_error "Failed to create/reset local $BRANCH from FETCH_HEAD"
    exit 1
  fi

  # Set upstream if available, ignore errors if not
  git branch --set-upstream-to="origin/$BRANCH" "$BRANCH" >/dev/null 2>&1 || true

  print_success "Successfully switched to ZaneyOS 2.4 ($BRANCH branch)"
}

# Check command line arguments
if [ "$1" = "--revert" ]; then
    revert_from_backup
    exit $?
fi

print_header "ZaneyOS 2.3 → 2.4 Upgrade Script"

echo -e "${CYAN}🚀 Welcome to the ZaneyOS 2.4 Upgrade Script!${NC}"
echo ""
echo -e "${YELLOW}📋 This script will:${NC}"
echo -e "  • Create a complete backup of your current system"
echo -e "  • Verify you're currently running ZaneyOS 2.3"
echo -e "  • Upgrade to ZaneyOS 2.4 from $BRANCH"
echo -e "  • Merge new 2.4 variables into your host configuration"
echo -e "  • Handle terminal dependencies automatically"
echo -e "  • Use safe 'boot' option to avoid SDDM display issues"
echo -e "  • Prompt for reboot after completion"
echo ""
echo -e "${CYAN}💾 Revert Instructions:${NC}"
echo -e "  If something goes wrong, run: $0 --revert"
echo ""

# Change to zaneyos directory
if [ ! -d "$ZANEYOS_DIR" ]; then
    print_error "ZaneyOS directory not found at $ZANEYOS_DIR"
    print_error "Please ensure ZaneyOS is installed at ~/zaneyos"
    exit 1
fi

cd "$ZANEYOS_DIR" || exit 1

print_header "Pre-Flight Checks"

# Check if we're in a ZaneyOS directory
if [ ! -f "./flake.nix" ] || [ ! -d "./hosts" ]; then
  print_error "This doesn't appear to be a ZaneyOS directory."
  print_error "Please ensure you're in the correct directory."
  exit 1
fi

print_success "ZaneyOS directory structure detected"

# Check if git is available
if ! command -v git &> /dev/null; then
  print_error "Git is not installed."
  exit 1
fi

print_success "Git is available"

# Check if NH is available (we'll use it for the rebuild)
if ! command -v nh &> /dev/null; then
  print_warning "NH (Nix Helper) not found. Will use nixos-rebuild directly."
  USE_NH=false
else
  print_success "NH (Nix Helper) detected"
  USE_NH=true
fi

print_header "Version Verification"

# Check current branch/version
CURRENT_BRANCH=$(git branch --show-current)
print_info "Current branch: $CURRENT_BRANCH"

# Verify this appears to be version 2.3
if [ ! -f "./hosts/default/variables.nix" ]; then
  print_error "Cannot find default variables.nix file"
  exit 1
fi

# Check if we have 2.4 features (this indicates the TEMPLATE is 2.4)
# Do NOT abort: users may still have 2.3 host files to migrate.
if grep -q "displayManager" ./hosts/default/variables.nix; then
  print_warning "Template variables.nix includes 2.4+ fields (displayManager found)."
  print_info "Proceeding: we will still migrate host files from your 2.3 backup."
else
  print_success "Verified: Template appears to be ZaneyOS 2.3-style"
fi

# Comprehensive pre-check analysis
perform_precheck_analysis() {
    local analysis_file="$HOME/zaneyos-upgrade-analysis-$TIMESTAMP.txt"
    
    print_header "Pre-Upgrade Analysis"
    print_info "Analyzing your current ZaneyOS configuration..."
    print_info "Analysis report will be saved to: $analysis_file"
    
    {
        echo "============================================"
        echo "  ZaneyOS 2.3 → 2.4 Upgrade Analysis Report"
        echo "  Generated: $(date)"
        echo "  System: $(hostname)"
        echo "============================================"
        echo ""
        
        # Analyze flake.nix customizations
        echo "🔧 FLAKE.NIX ANALYSIS:"
        if [ -f "./flake.nix" ]; then
            # Check for custom inputs
            echo "📦 Custom Inputs Detected:"
            custom_inputs=$(grep -A 20 "inputs = {" ./flake.nix | grep -v "nixpkgs\|home-manager\|hyprland\|stylix" | grep -E "\w+\.(url|github|gitlab)" || echo "  None detected")
            echo "$custom_inputs"
            echo ""
            
            # Check current profile
            current_profile=$(grep 'profile = ' ./flake.nix | sed 's/.*= *"\([^"]*\)".*/\1/' || echo "Unknown")
            echo "📍 Current Profile: $current_profile"
            echo ""
        else
            echo "❌ flake.nix not found"
        fi
        
        # Analyze host configurations
        echo "🏠 HOST CONFIGURATIONS ANALYSIS:"
        host_count=0
        for dir in hosts/*/; do
            hostname=$(basename "$dir")
            if [ "$hostname" != "default" ]; then
                ((host_count++))
                echo "  📂 Host: $hostname"
                
                # Check which files exist
                [ -f "$dir/variables.nix" ] && echo "    ✅ variables.nix (WILL BE MIGRATED)"
                [ -f "$dir/hardware.nix" ] && echo "    ✅ hardware.nix (WILL BE PRESERVED)"
                [ -f "$dir/host-packages.nix" ] && echo "    ✅ host-packages.nix (WILL BE PRESERVED)"
                
                # Check if default.nix is customized
                if [ -f "$dir/default.nix" ]; then
                    if ! cmp -s "$dir/default.nix" "./hosts/default/default.nix" 2>/dev/null; then
                        echo "    ✅ default.nix (CUSTOMIZED - WILL BE PRESERVED)"
                        echo "      📋 Custom imports detected:"
                        grep -E "\./|\.\." "$dir/default.nix" | sed 's/^/        /' || echo "        (parsing error)"
                    else
                        echo "    📋 default.nix (standard template)"
                    fi
                fi
                echo ""
            fi
        done
        echo "📊 Total hosts to migrate: $host_count"
        echo ""
        
        # Analyze global packages
        echo "📦 GLOBAL PACKAGES ANALYSIS:"
        if [ -f "./modules/core/packages.nix" ]; then
            # Count total packages
            package_count=$(grep -c "^[[:space:]]*[a-zA-Z]" ./modules/core/packages.nix | head -1)
            echo "📊 Approximate package count: $package_count"
            
            # Check for custom additions (commented out packages that user might have enabled)
            echo "🔍 Potentially customized packages:"
            grep -E "^[[:space:]]*#[a-zA-Z]" ./modules/core/packages.nix | head -10 | sed 's/^/  /' || echo "  None detected"
            echo "📋 packages.nix status: WILL BE ANALYZED AND PRESERVED IF CUSTOMIZED"
        else
            echo "❌ modules/core/packages.nix not found"
        fi
        echo ""
        
        # Analyze shell customizations
        echo "🐚 SHELL CUSTOMIZATIONS ANALYSIS:"
        shell_custom_found=false
        
        # Check zsh customizations
        if [ -f "./modules/home/zsh/default.nix" ]; then
            if ! cmp -s "./modules/home/zsh/default.nix" "./hosts/default/modules/home/zsh/default.nix" 2>/dev/null; then
                echo "  ⚠️  modules/home/zsh/default.nix - CUSTOMIZED (REQUIRES MANUAL MERGE)"
                shell_custom_found=true
            fi
        fi
        
        if [ -f "./modules/home/zsh/zshrc-personal.nix" ]; then
            echo "  ⚠️  modules/home/zsh/zshrc-personal.nix - PERSONAL FILE (REQUIRES MANUAL MERGE)"
            shell_custom_found=true
        fi
        
        # Check bash customizations
        if [ -f "./modules/home/bash.nix" ]; then
            if ! cmp -s "./modules/home/bash.nix" "./hosts/default/modules/home/bash.nix" 2>/dev/null; then
                echo "  ⚠️  modules/home/bash.nix - CUSTOMIZED (REQUIRES MANUAL MERGE)"
                shell_custom_found=true
            fi
        fi
        
        if [ -f "./modules/home/bashrc-personal.nix" ]; then
            echo "  ⚠️  modules/home/bashrc-personal.nix - PERSONAL FILE (REQUIRES MANUAL MERGE)"
            shell_custom_found=true
        fi
        
        # Check eza customizations
        if [ -f "./modules/home/eza.nix" ]; then
            if ! cmp -s "./modules/home/eza.nix" "./hosts/default/modules/home/eza.nix" 2>/dev/null; then
                echo "  ⚠️  modules/home/eza.nix - CUSTOMIZED (REQUIRES MANUAL MERGE)"
                shell_custom_found=true
            fi
        fi
        
        # Check Hyprland customizations
        if [ -d "./modules/home/hyprland" ]; then
            echo "  🪟 Checking Hyprland configurations..."
            hyprland_files=$(find ./modules/home/hyprland -name "*.nix" -type f 2>/dev/null | wc -l)
            if [ "$hyprland_files" -gt 0 ]; then
                echo "  ⚠️  modules/home/hyprland/ - HYPRLAND CONFIGS DETECTED ($hyprland_files files)"
                echo "     🚨 CRITICAL: Hyprland configs contain complex settings that CANNOT be auto-migrated"
                echo "     📋 Files detected:"
                find ./modules/home/hyprland -name "*.nix" -type f | sed 's|^./|      |' 2>/dev/null || echo "      (error listing files)"
                echo "     ⚠️  These require careful manual review and migration after upgrade"
                echo "     💡 Backup location will contain your current configs for reference"
                shell_custom_found=true
            fi
        fi
        
        if [ "$shell_custom_found" = false ]; then
            echo "  ✅ No shell customizations detected"
        fi
        echo ""
        
        # Git repository analysis
        echo "🔄 GIT REPOSITORY ANALYSIS:"
        if [ -d ".git" ]; then
            # Current branch and remote
            current_branch=$(git branch --show-current 2>/dev/null || echo "unknown")
            echo "  📍 Current branch: $current_branch"
            
            # Remote information
            if git remote get-url origin >/dev/null 2>&1; then
                remote_url=$(git remote get-url origin 2>/dev/null)
                echo "  🌐 Remote origin: $remote_url"
                
                # Check if it's a fork or custom repo
                if [[ "$remote_url" != *"zaney/zaneyos"* ]]; then
                    echo "  ⚠️  CUSTOM REPOSITORY DETECTED!"
                    echo "     This appears to be a fork or custom repository."
                    echo "     Consider running the comparison tool for detailed analysis:"
                    echo "     ./compare-zaneyos-config.sh -r $remote_url -b $current_branch"
                fi
            fi
            
            # Check for uncommitted changes
            if git diff-index --quiet HEAD -- 2>/dev/null; then
                echo "  ✅ No uncommitted changes"
            else
                echo "  ⚠️  UNCOMMITTED CHANGES DETECTED!"
                echo "     You have uncommitted changes that won't be preserved."
                echo "     Consider committing or stashing them before upgrade."
                uncommitted_files=$(git status --porcelain | wc -l)
                echo "     Number of modified files: $uncommitted_files"
            fi
            
            # Last commit info
            if git rev-parse HEAD >/dev/null 2>&1; then
                last_commit=$(git log -1 --format="%h - %s (%cr)" 2>/dev/null)
                echo "  📝 Last commit: $last_commit"
            fi
        else
            echo "  ⚠️  Not a git repository"
            echo "     Consider initializing git for better version control:"
            echo "     git init && git add . && git commit -m 'Initial ZaneyOS configuration'"
        fi
        echo ""
        
        # Check for other common customization locations
        echo "🔍 OTHER CUSTOMIZATIONS ANALYSIS:"
        other_custom_found=false
        
        # Check for custom modules
        if [ -d "./modules" ]; then
            echo "  📂 Checking modules directory for customizations..."
            # Find any .nix files that might be custom
            find ./modules -name "*.nix" -type f | while read -r file; do
                if [[ "$file" =~ (personal|custom|local) ]]; then
                    echo "  ⚠️  $file - PERSONAL/CUSTOM FILE (REQUIRES MANUAL MERGE)"
                    other_custom_found=true
                fi
            done
        fi
        
        # Check for wallpapers
        if [ -d "./wallpapers" ]; then
            wallpaper_count=$(find ./wallpapers -type f | wc -l)
            if [ "$wallpaper_count" -gt 10 ]; then  # Assuming default has ~10 wallpapers
                echo "  🖼️  Custom wallpapers detected: $wallpaper_count total (WILL BE PRESERVED)"
            fi
        fi
        
        if [ "$other_custom_found" = false ]; then
            echo "  ✅ No other major customizations detected"
        fi
        echo ""
        
        # Migration summary
        echo "============================================"
        echo "📋 MIGRATION SUMMARY:"
        echo "============================================"
        echo ""
        echo "✅ WILL BE AUTOMATICALLY MIGRATED:"
        echo "   • All host configurations (variables.nix with 2.4 format conversion)"
        echo "   • Hardware configurations (hardware.nix)"
        echo "   • Host-specific packages (host-packages.nix)"
        echo "   • Customized host imports (default.nix if modified)"
        echo "   • Global packages (modules/core/packages.nix if customized)"
        echo "   • Wallpapers and themes"
        echo ""
        echo "⚠️  REQUIRES MANUAL ATTENTION AFTER UPGRADE:"
        if [ "$custom_inputs" != "  None detected" ]; then
            echo "   • Custom flake.nix inputs - you'll need to re-add these"
        fi
        if [ "$shell_custom_found" = true ]; then
            echo "   • Shell customizations (zsh/bash personal files and modifications)"
        fi
        if [ "$other_custom_found" = true ]; then
            echo "   • Custom/personal module files"
        fi
        # Check for Hyprland configs to add to manual attention list
        if [ -d "./modules/home/hyprland" ] && [ "$(find ./modules/home/hyprland -name '*.nix' -type f 2>/dev/null | wc -l)" -gt 0 ]; then
            echo "   • 🚨 HYPRLAND CONFIGURATIONS - Cannot be auto-migrated, manual review required"
        fi
        if [ "$custom_inputs" = "  None detected" ] && [ "$shell_custom_found" = false ] && [ "$other_custom_found" = false ]; then
            echo "   • No manual intervention required - standard configuration detected!"
        fi
        echo ""
        echo "📁 BACKUP LOCATION (after upgrade starts):"
        echo "   ~/.config/zaneyos-backups/zaneyos-2.3-upgrade-backup-$TIMESTAMP/"
        echo ""
        echo "📝 POST-UPGRADE TODO:"
        echo "   1. Reboot system after successful upgrade"
        echo "   2. Verify all applications and settings work correctly"
        if [ "$custom_inputs" != "  None detected" ] || [ "$shell_custom_found" = true ] || [ "$other_custom_found" = true ]; then
            echo "   3. Manually merge any flagged customizations from backup"
        fi
        echo "   4. Review new 2.4 features and packages"
        echo ""
        echo "============================================"
        echo "End of Analysis Report"
        echo "============================================"
        
    } | tee "$analysis_file"
    
    print_success "Analysis complete! Report saved to: $analysis_file"
    echo ""
    
    # Ask user if they want to continue after seeing the analysis
    prompt_yes "Based on this analysis, do you want to proceed with the upgrade? (Y/N):"
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Upgrade cancelled by user after analysis review."
        print_info "Analysis report is saved for your reference at: $analysis_file"
        exit 0
    fi
}

# Run the pre-check analysis
perform_precheck_analysis

# Create backup FIRST before making any changes
if ! create_backup; then
    print_error "Failed to create backup. Aborting upgrade."
    exit 1
fi

# Confirm with user before proceeding
echo ""
echo -e "${GREEN}✅ Backup created successfully!${NC}"
echo -e "${YELLOW}📍 Backup location: $BACKUP_DIR${NC}"
echo ""
prompt_yes "Continue with the upgrade to ZaneyOS 2.4? (Y/N):"
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "Upgrade cancelled by user."
    print_info "Your backup is preserved at: $BACKUP_DIR"
    exit 0
fi

print_header "Fetching ZaneyOS 2.4"

# Switch to main robustly, handling uncommitted changes and divergent branches
switch_to_main_handling_dirty

print_header "Discovering Host Configurations"

# Important: Discover hosts from the BACKUP, not the current working tree
# This ensures we preserve user hosts even if switching branches removed them
print_info "Discovering custom hosts from backup to avoid any branch-change side effects..."
HOST_DIRS=()
if [ -d "$BACKUP_DIR/zaneyos/hosts" ]; then
    for dir in "$BACKUP_DIR/zaneyos/hosts"/*/; do
        [ -d "$dir" ] || continue
        hostname=$(basename "$dir")
        if [ "$hostname" != "default" ]; then
            HOST_DIRS+=("$hostname")
        fi
    done
fi

if [ ${#HOST_DIRS[@]} -eq 0 ]; then
    print_error "No custom host configurations found in backup"
    print_error "This upgrade script requires at least one custom host configuration"
    exit 1
fi

print_success "Found ${#HOST_DIRS[@]} host configuration(s): ${HOST_DIRS[*]}"

print_header "Upgrading Host Configurations"

# Function to merge variables from 2.3 to 2.4
merge_variables() {
    local hostname=$1
    local old_vars_file="$BACKUP_DIR/zaneyos/hosts/$hostname/variables.nix"
    local new_vars_file="./hosts/$hostname/variables.nix"
    
    print_info "Processing host: $hostname"
    
    # Create host directory if it doesn't exist
    mkdir -p "./hosts/$hostname"
    
    # Copy the new 2.4 template
    cp "./hosts/default/variables.nix" "$new_vars_file"
    
    # Extract values from old 2.3 configuration
    if [ -f "$old_vars_file" ]; then
        # Extract key values using more robust parsing
        local git_username=$(grep 'gitUsername' "$old_vars_file" | sed 's/.*= *"\([^"]*\)".*/\1/')
        local git_email=$(grep 'gitEmail' "$old_vars_file" | sed 's/.*= *"\([^"]*\)".*/\1/')
        local browser=$(grep 'browser' "$old_vars_file" | sed 's/.*= *"\([^"]*\)".*/\1/')
        local terminal=$(grep 'terminal' "$old_vars_file" | sed 's/.*= *"\([^"]*\)".*/\1/')
        local keyboard_layout=$(grep 'keyboardLayout' "$old_vars_file" | sed 's/.*= *"\([^"]*\)".*/\1/')
        local console_keymap=$(grep 'consoleKeyMap' "$old_vars_file" | sed 's/.*= *"\([^"]*\)".*/\1/')
        local enable_nfs=$(grep 'enableNFS' "$old_vars_file" | sed 's/.*= *\([^;]*\);.*/\1/')
        local print_enable=$(grep 'printEnable' "$old_vars_file" | sed 's/.*= *\([^;]*\);.*/\1/')
        local thunar_enable=$(grep 'thunarEnable' "$old_vars_file" | sed 's/.*= *\([^;]*\);.*/\1/')
        local clock_24h=$(grep 'clock24h' "$old_vars_file" | sed 's/.*= *\([^;]*\);.*/\1/')
        
        # Extract additional 2.4 variables that might exist in 2.3
        local doom_emacs_enable=$(grep 'doomEmacsEnable' "$old_vars_file" | sed 's/.*= *\([^;]*\);.*/\1/')
        local intel_id=$(grep 'intelID' "$old_vars_file" | sed 's/.*= *"\([^"]*\)".*/\1/')
        local nvidia_id=$(grep 'nvidiaID' "$old_vars_file" | sed 's/.*= *"\([^"]*\)".*/\1/')
        local host_id=$(grep 'hostId' "$old_vars_file" | sed 's/.*= *"\([^"]*\)".*/\1/')
        
        # Apply the values to new configuration
        [ -n "$git_username" ] && sed -i "s/gitUsername = \".*\";/gitUsername = \"$git_username\";/" "$new_vars_file"
        [ -n "$git_email" ] && sed -i "s/gitEmail = \".*\";/gitEmail = \"$git_email\";/" "$new_vars_file"
        [ -n "$browser" ] && sed -i "s/browser = \".*\";/browser = \"$browser\";/" "$new_vars_file"
        [ -n "$terminal" ] && sed -i "s/terminal = \".*\";/terminal = \"$terminal\";/" "$new_vars_file"
        [ -n "$keyboard_layout" ] && sed -i "s/keyboardLayout = \".*\";/keyboardLayout = \"$keyboard_layout\";/" "$new_vars_file"
        [ -n "$console_keymap" ] && sed -i "s/consoleKeyMap = \".*\";/consoleKeyMap = \"$console_keymap\";/" "$new_vars_file"
        [ -n "$enable_nfs" ] && sed -i "s/enableNFS = .*/enableNFS = $enable_nfs;/" "$new_vars_file"
        [ -n "$print_enable" ] && sed -i "s/printEnable = .*/printEnable = $print_enable;/" "$new_vars_file"
        [ -n "$thunar_enable" ] && sed -i "s/thunarEnable = .*/thunarEnable = $thunar_enable;/" "$new_vars_file"
        [ -n "$clock_24h" ] && sed -i "s/clock24h = .*/clock24h = $clock_24h;/" "$new_vars_file"
        
        # Apply additional 2.4 variables if they existed in 2.3
        [ -n "$doom_emacs_enable" ] && sed -i "s/doomEmacsEnable = .*/doomEmacsEnable = $doom_emacs_enable;/" "$new_vars_file"
        [ -n "$intel_id" ] && sed -i "s/intelID = \".*\";/intelID = \"$intel_id\";/" "$new_vars_file"
        [ -n "$nvidia_id" ] && sed -i "s/nvidiaID = \".*\";/nvidiaID = \"$nvidia_id\";/" "$new_vars_file"
        [ -n "$host_id" ] && sed -i "s/hostId = \".*\";/hostId = \"$host_id\";/" "$new_vars_file"
        
        # Handle terminal-specific enables - CRITICAL for 2.4
        case "$terminal" in
            "alacritty")
                sed -i "s/alacrittyEnable = false;/alacrittyEnable = true;/" "$new_vars_file"
                print_success "✓ Enabled Alacritty for host $hostname"
                ;;
            "wezterm")
                sed -i "s/weztermEnable = false;/weztermEnable = true;/" "$new_vars_file"
                print_success "✓ Enabled WezTerm for host $hostname"
                ;;
            "ghostty")
                sed -i "s/ghosttyEnable = false;/ghosttyEnable = true;/" "$new_vars_file"
                print_success "✓ Enabled Ghostty for host $hostname"
                ;;
            "kitty")
                print_info "✓ Kitty is enabled by default"
                ;;
            *)
                print_warning "Unknown terminal '$terminal' - keeping kitty as default"
                sed -i "s/terminal = \".*\";/terminal = \"kitty\";/" "$new_vars_file"
                ;;
        esac
        
        # Copy stylixImage, waybarChoice, and animChoice if they exist
        local stylix_image=$(grep 'stylixImage' "$old_vars_file" | head -1)
        if [ -n "$stylix_image" ]; then
            # Replace the active stylixImage line
            local line_num=$(grep -n 'stylixImage = .*mountainscapedark.jpg;' "$new_vars_file" | cut -d: -f1)
            if [ -n "$line_num" ]; then
                sed -i "${line_num}s|.*|  $stylix_image|" "$new_vars_file"
                print_success "✓ Preserved stylixImage setting"
            fi
        fi
        
        local waybar_choice=$(grep 'waybarChoice = ' "$old_vars_file" | grep -v '^[[:space:]]*#')
        if [ -n "$waybar_choice" ]; then
            # Replace the active waybarChoice line
            local line_num=$(grep -n 'waybarChoice = .*waybar-curved.nix;' "$new_vars_file" | cut -d: -f1)
            if [ -n "$line_num" ]; then
                sed -i "${line_num}s|.*|  $waybar_choice|" "$new_vars_file"
                print_success "✓ Preserved waybarChoice setting"
            fi
        fi
        
        local anim_choice=$(grep 'animChoice = ' "$old_vars_file" | grep -v '^[[:space:]]*#')
        if [ -n "$anim_choice" ]; then
            # Replace the active animChoice line
            local line_num=$(grep -n 'animChoice = .*animations-def.nix;' "$new_vars_file" | cut -d: -f1)
            if [ -n "$line_num" ]; then
                sed -i "${line_num}s|.*|  $anim_choice|" "$new_vars_file"
                print_success "✓ Preserved animChoice setting"
            fi
        fi
        
        # Handle monitor settings
        local monitor_start=$(grep -n 'extraMonitorSettings = "' "$old_vars_file" | cut -d: -f1)
        if [ -n "$monitor_start" ]; then
            local monitor_end=$(tail -n +"$monitor_start" "$old_vars_file" | grep -n '";' | head -1 | cut -d: -f1)
            if [ -n "$monitor_end" ]; then
                local total_end=$((monitor_start + monitor_end - 1))
                local monitor_settings=$(sed -n "${monitor_start},${total_end}p" "$old_vars_file")
                
                # Replace the monitor settings in new file
                local new_monitor_start=$(grep -n 'extraMonitorSettings = "' "$new_vars_file" | cut -d: -f1)
                if [ -n "$new_monitor_start" ]; then
                    local new_monitor_end=$(tail -n +"$new_monitor_start" "$new_vars_file" | grep -n '";' | head -1 | cut -d: -f1)
                    if [ -n "$new_monitor_end" ]; then
                        local new_total_end=$((new_monitor_start + new_monitor_end - 1))
                        # Delete old monitor settings and insert new ones
                        sed -i "${new_monitor_start},${new_total_end}d" "$new_vars_file"
                        sed -i "$((new_monitor_start - 1))r /dev/stdin" "$new_vars_file" <<< "$monitor_settings"
                        print_success "✓ Preserved monitor settings"
                    fi
                fi
            fi
        fi

        # Final safety: remove any duplicate keys that might have slipped in
        cleanup_duplicates "$new_vars_file"
        
        print_success "Configuration merged for host: $hostname"
    else
        print_warning "No backup found for host: $hostname, using defaults"
    fi
    
    # Also copy hardware.nix if it exists
    if [ -f "$BACKUP_DIR/zaneyos/hosts/$hostname/hardware.nix" ]; then
        cp "$BACKUP_DIR/zaneyos/hosts/$hostname/hardware.nix" "./hosts/$hostname/"
        print_success "✓ Preserved hardware.nix for host: $hostname"
    fi
    
    # Also copy host-packages.nix if it exists (user's custom packages)
    if [ -f "$BACKUP_DIR/zaneyos/hosts/$hostname/host-packages.nix" ]; then
        cp "$BACKUP_DIR/zaneyos/hosts/$hostname/host-packages.nix" "./hosts/$hostname/"
        print_success "✓ Preserved host-packages.nix for host: $hostname"
    fi
    
    # Also copy default.nix if it was customized (compare with template first)
    if [ -f "$BACKUP_DIR/zaneyos/hosts/$hostname/default.nix" ]; then
        # Check if it's different from the template default.nix
        if ! cmp -s "$BACKUP_DIR/zaneyos/hosts/$hostname/default.nix" "./hosts/default/default.nix"; then
            cp "$BACKUP_DIR/zaneyos/hosts/$hostname/default.nix" "./hosts/$hostname/"
            print_success "✓ Preserved customized default.nix for host: $hostname"
        else
            print_info "✓ Using template default.nix for host: $hostname (no customizations detected)"
        fi
    fi
}

# Process each host
for hostname in "${HOST_DIRS[@]}"; do
    merge_variables "$hostname"
done

print_header "Checking Global Package Customizations"

# Check if user has customized the global packages.nix file
if [ -f "$BACKUP_DIR/zaneyos/modules/core/packages.nix" ]; then
    print_info "Checking for custom packages in global packages.nix..."
    
    # Compare with new template to see if there are customizations
    if ! cmp -s "$BACKUP_DIR/zaneyos/modules/core/packages.nix" "./modules/core/packages.nix"; then
        print_warning "Custom packages detected in global packages.nix"
        
        # Create a backup of the new packages.nix
        cp "./modules/core/packages.nix" "./modules/core/packages.nix.template"
        
        # Copy the user's customized version
        cp "$BACKUP_DIR/zaneyos/modules/core/packages.nix" "./modules/core/packages.nix"
        
        print_success "✓ Preserved custom global packages.nix"
        print_info "📋 Note: Your custom packages have been preserved"
        print_info "📋 New template available at: modules/core/packages.nix.template"
        print_info "📋 You may want to review for new packages to add from the template"
        
        # Offer to show differences
        echo ""
        prompt_yes "Would you like to see what packages were added in 2.4? (Y/N):"
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_info "New packages available in ZaneyOS 2.4:"
            echo -e "${CYAN}=== Differences between your packages.nix and 2.4 template ===${NC}"
            diff -u "./modules/core/packages.nix" "./modules/core/packages.nix.template" || true
            echo ""
            print_info "You can manually add any new packages you want from the template"
        fi
    else
        print_success "✓ No custom packages detected - using new 2.4 packages.nix"
    fi
else
    print_warning "No backup found for modules/core/packages.nix - using defaults"
fi

# Function to detect and update flake.nix with user's actual configuration
update_flake_configuration() {
    print_header "Updating Flake Configuration"
    
    # Detect current username (prefer from old config, fallback to current user)
    local detected_username
    if [ -n "${HOST_DIRS[0]}" ] && [ -f "$BACKUP_DIR/zaneyos/hosts/${HOST_DIRS[0]}/variables.nix" ]; then
        detected_username=$(grep 'gitUsername' "$BACKUP_DIR/zaneyos/hosts/${HOST_DIRS[0]}/variables.nix" | sed 's/.*= *"\([^"]*\)".*/\1/' | head -1)
    fi
    detected_username=${detected_username:-$(whoami)}
    
    # Detect current hostname (prefer from system, fallback to first host directory)
    local detected_hostname=$(hostname)
    if [[ "$detected_hostname" == "nixos" ]] || [[ -z "$detected_hostname" ]]; then
        detected_hostname=${HOST_DIRS[0]}
    fi
    
    # Detect GPU profile from hardware or ask user
    local detected_profile="vm"  # default fallback
    print_info "Detecting GPU profile..."
    
    # Check for NVIDIA
    if lspci | grep -i nvidia >/dev/null 2>&1; then
        # Check if it's a laptop/mobile GPU
        if lspci | grep -i nvidia | grep -i "mobile\|laptop" >/dev/null 2>&1; then
            detected_profile="nvidia-laptop"
        else
            detected_profile="nvidia"
        fi
    # Check for AMD
    elif lspci | grep -i amd | grep -i "VGA\|Display" >/dev/null 2>&1; then
        detected_profile="amd"  
    # Check for Intel
    elif lspci | grep -i intel | grep -i "VGA\|Display" >/dev/null 2>&1; then
        detected_profile="intel"
    # Check if we're in a VM environment
    elif systemd-detect-virt >/dev/null 2>&1; then
        detected_profile="vm"
        print_info "Virtual machine environment detected"
    fi
    
    print_info "Detected configuration:"
    print_info "  Username: $detected_username"
    print_info "  Hostname: $detected_hostname" 
    print_info "  GPU Profile: $detected_profile"
    
    # Confirm with user before updating
    echo ""
    prompt_yes "Update flake.nix with detected configuration? (Y/N):"
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_warning "Skipping flake.nix update - using current values"
        return 0
    fi
    
    # Update flake.nix with detected values
    print_info "Updating flake.nix..."
    sed -i "s/username = \"[^\"]*\";/username = \"$detected_username\";/" ./flake.nix
    sed -i "s/host = \"[^\"]*\";/host = \"$detected_hostname\";/" ./flake.nix  
    sed -i "s/profile = \"[^\"]*\";/profile = \"$detected_profile\";/" ./flake.nix
    
    print_success "✓ Updated flake.nix with detected configuration"
    
    # Show what was updated
    print_info "Updated flake.nix contents:"
    echo -e "${CYAN}$(grep -A 3 -E 'host =|username =|profile =' ./flake.nix)${NC}"
    echo ""
}

# Update flake.nix with user's actual configuration
update_flake_configuration

print_header "Building ZaneyOS 2.4"

print_warning "Using 'boot' option to avoid SDDM display issues"
print_info "This is safer than 'switch' when changing display managers"

# Get the GPU profile from flake.nix (this determines which nixosConfiguration to use)
# The actual build target is the GPU profile (amd, nvidia, nvidia-laptop, intel, vm)
# not the internal 'profile' variable which is just passed to modules
GPU_PROFILE=$(grep 'profile = ' ./flake.nix | sed 's/.*= *"\([^"]*\)".*/\1/')
print_info "Using GPU profile for build: $GPU_PROFILE"

# Build the system
echo ""
prompt_yes "Ready to build ZaneyOS 2.4? This may take several minutes. (Y/N):"
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "Build cancelled. You can run this script again later."
    print_info "To revert to 2.3: $0 --revert"
    exit 0
fi

print_info "Starting build process..."

BUILD_SUCCESS=false

if [ "$USE_NH" = true ]; then
    print_info "Using NH for build..."
    if nh os boot ~/zaneyos --hostname "$GPU_PROFILE"; then
        BUILD_SUCCESS=true
    fi
else
    print_info "Using nixos-rebuild for build..."
    if sudo nixos-rebuild boot --flake ~/zaneyos/#"$GPU_PROFILE"; then
        BUILD_SUCCESS=true
    fi
fi

print_header "Upgrade Results"

if [ "$BUILD_SUCCESS" = true ]; then
    print_success_banner
    
    echo ""
    echo -e "${CYAN}🔧 Key Changes in ZaneyOS 2.4:${NC}"
    echo -e "  • SDDM is now the default display manager"
    echo -e "  • Terminal applications can be individually enabled/disabled"
    echo -e "  • New application enable/disable toggles available"
    echo -e "  • Improved configuration structure"
    echo ""
    
    echo -e "${YELLOW}📝 Next Steps:${NC}"
    echo -e "  1. Reboot your system to complete the upgrade"
    echo -e "  2. SDDM will be your new login screen"
    echo -e "  3. Your custom settings have been preserved"
    echo -e "  4. Check that all your preferred applications are still available"
    echo ""
    
    echo -e "${CYAN}🔄 Revert Option:${NC}"
    echo -e "  If you encounter issues, run: $0 --revert"
    echo -e "  Your 2.3 backup is preserved at: $BACKUP_DIR"
    echo ""
    
    # Prompt for reboot
    prompt_yes "Would you like to reboot now? (Y/N):"
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_info "Rebooting in 5 seconds... (Press Ctrl+C to cancel)"
        sleep 5
        sudo reboot
    else
        echo -e "${GREEN}✅ Upgrade complete! Remember to reboot when convenient.${NC}"
    fi
    
else
    print_failure_banner
    echo ""
    echo -e "${YELLOW}🔄 Recovery Options:${NC}"
    echo -e "  • Run revert command: $0 --revert"
    echo -e "  • Your backup is available at: $BACKUP_DIR"
    echo -e "  • Review the log file: $LOG_FILE"
    echo ""
    
    prompt_yes "Would you like to automatically revert to ZaneyOS 2.3? (Y/N):"
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        revert_from_backup
    else
        print_info "Manual revert available with: $0 --revert"
    fi
    
    exit 1
fi
