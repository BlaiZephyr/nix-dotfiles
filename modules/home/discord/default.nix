{
  lib,
  config,
  inputs,
  ...
}: {
  options.hm = {
    discord.enable = lib.mkEnableOption "enable discord / nixcord";
  };

  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];

  config = lib.mkIf config.hm.discord.enable {
    programs.nixcord = {
      enable = true;
      discord.enable = false;
      vesktop.enable = true;
      quickCss = builtins.readFile ../../extras/styles/custom.css;
      config = {
        frameless = false;
        plugins = {
          hideAttachments.enable = true;
          memberCount.enable = true;
          mentionAvatars.enable = true;
          alwaysAnimate.enable = true;
          webScreenShareFixes.enable = true;
          betterRoleContext.enable = true;
        };
      };
    };
  };
}
