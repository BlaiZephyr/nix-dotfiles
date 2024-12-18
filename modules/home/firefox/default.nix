{
  lib,
  config,
  ...
}: {
  options.hm = {
    firefox.enable = lib.mkEnableOption "enable firefox with extensions";
  };
  config = lib.mkIf config.hm.firefox.enable {
    programs = {
      firefox = {
        enable = true;
        languagePacks = [
          "de"
          "en-US"
        ];

        # Check about:policies#documentation for options.
        policies = {
          DisableTelemetry = true;
          DisableFirefoxStudies = true;
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
          DisablePocket = true;
          DisableFirefoxAccounts = true;
          DisableAccounts = true;
          DisableFirefoxScreenshots = true;
          OverrideFirstRunPage = "";
          OverridePostUpdatePage = "";
          DontCheckDefaultBrowser = true;
          DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
          DisplayMenuBar = "default-on"; # alternatives: "always", "never" or "default-on"
          SearchBar = "unified"; # alternative: "separate"

          # about:support for extension/add-on ID strings.
          ExtensionSettings = {
            "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
            # uBlock Origin:
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };
            # Bitwarden:
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/file/4392295/bitwarden_password_manager-2024.11.2.xpi";
              installation_mode = "force_installed";
            };
          };
        };
      };
    };
  };
}
