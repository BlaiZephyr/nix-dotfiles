{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "dwilliams";
  gitEmail = "don.e.williams@gmail.com";

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
  #To install: Enable here, zcli rebuild, then run zcli doom install
  doomEmacsEnable = false;

  # Hyprland Settings
  # Examples:
  # extraMonitorSettings = "monitor = Virtual-1,1920x1080@60,auto,1";
  # extraMonitorSettings = "monitor = HDMI-A-1,1920x1080@60,auto,1";
  # You can configure multiple monitors.
  # Inside the quotes, create a new line for each monitor.
  extraMonitorSettings = "

    ";

  # Waybar Settings
  clock24h = false;

  # Program Options
  # Set Default Browser (google-chrome-stable for google-chrome)
  # This does NOT install your browser
  # You need to install it by adding it to the `packages.nix`
  # or as a flatpak
  browser = "brave";

  # Available Options:
  # Kitty, ghostty, wezterm, aalacrity
  # Note: kitty, wezterm, alacritty have to be enabled in `variables.nix`
  # Setting it here does not enable it. Kitty is installed by default
  terminal = "kitty"; # Set Default System Terminal

  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For hybrid support (Intel/NVIDIA Prime or AMD/NVIDIA)
  intelID = "PCI:1:0:0";
  amdgpuID = "PCI:5:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = false;

  # Enable Thunar GUI File Manager
  # Yazi is default File Manager
  thunarEnable = false;

  # Themes, waybar and animation.
  #  Only uncomment your selection
  # The others much be commented out.

  # Set Stylix Image
  # This will set your color palette
  # Default background
  # Add new images to ~/zaneyos/wallpapers
  stylixImage = ../../wallpapers/mountainscapedark.jpg;
  #stylixImage = ../../wallpapers/AnimeGirlNightSky.jpg;
  #stylixImage = ../../wallpapers/Anime-Purple-eyes.png;
  #stylixImage = ../../wallpapers/Rainnight.jpg;
  #stylixImage = ../../wallpapers/zaney-wallpaper.jpg;
  #stylixImage = ../../wallpapers/nix-wallpapers-strips-logo.jpg;
  #stylixImage = ../../wallpapers/beautifulmountainscape.jpg;

  # Set Waybar
  #  Available Options:
  #waybarChoice = ../../modules/home/waybar/waybar-curved.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-ddubs-2.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-simple.nix;
  # Throwback to ZaneyOS v1.0
  #waybarChoice = ../../modules/home/waybar/waybar-jerry.nix;
  # Very colorful and bright colors
  #waybarChoice = ../../modules/home/waybar/waybar-nekodyke.nix;
  # DWM styled waybars from Matt at TheLinuxCast
  #waybarChoice = ../../modules/home/waybar/waybar-dwm.nix;
  waybarChoice = ../../modules/home/waybar/waybar-dwm-2.nix;

  # Set Animation style
  # Available options are:
  # animations-def.nix  (default)
  # animations-end4.nix (end-4 project very fluid)
  # animations-dynamic.nix (ml4w project)
  # animations-moving.nix (ml4w project)
  #animChoice = ../../modules/home/hyprland/animations-def.nix;
  #animChoice = ../../modules/home/hyprland/animations-end4.nix;
  animChoice = ../../modules/home/hyprland/animations-dynamic.nix;
  #animChoice = ../../modules/home/hyprland/animations-moving.nix;

  # Set network hostId if required (needed for zfs)
  # Otherwise leave as-is
  hostId = "5ab03f50";
}
