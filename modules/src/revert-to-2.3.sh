#!/usr/bin/env bash

##########################################
# ZaneyOS Revert Script: 2.4 → 2.3
# Author: Don Williams
# This is a simple wrapper for the revert functionality
##########################################

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                    ZaneyOS 2.4 → 2.3 Revert Script                   ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════╝${NC}"

echo ""
echo -e "${YELLOW}⚠️  This will revert your ZaneyOS installation from 2.4 back to 2.3${NC}"
echo -e "${CYAN}ℹ️  This uses your upgrade backup to restore the previous configuration${NC}"
echo ""

# Check if the main upgrade script exists
UPGRADE_SCRIPT="./upgrade-2.3-to-2.4.sh"
if [ ! -f "$UPGRADE_SCRIPT" ]; then
    echo -e "${RED}❌ Error: upgrade-2.3-to-2.4.sh not found in current directory${NC}"
    echo -e "${CYAN}Please ensure you're in the ~/zaneyos directory${NC}"
    exit 1
fi

# Check if it's executable
if [ ! -x "$UPGRADE_SCRIPT" ]; then
    echo -e "${YELLOW}⚠️  Making upgrade script executable...${NC}"
    chmod +x "$UPGRADE_SCRIPT"
fi

# Ensure the upgrade script targets the stable 2.4 branch for consistency
export BRANCH="${BRANCH:-stable-2.4}"

# Run the revert function
echo -e "${GREEN}🔄 Starting revert process...${NC}"
"$UPGRADE_SCRIPT" --revert
