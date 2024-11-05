{inputs, ...}: {
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];

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
}
