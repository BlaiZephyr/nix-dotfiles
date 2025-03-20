{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "BlaiZephyr";
  gitEmail = "arbeit.t.lechner@gmail.com";

  # Hyprland Settings
  extraMonitorSettings = "";

  # Waybar Settings
  clock24h = false;

  # Program Options
  browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "de";
  consoleKeyMap = "de";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = false;

  # Set Stylix Image
  stylixImage = ../../wallpapers/AnimeGirlNightSky.jpg;

  # Set Waybar
  # Zaneyos includes an alternate waybar-ddubs.nix 
  waybarChoice = ../../modules/home/waybar.nix;
}
