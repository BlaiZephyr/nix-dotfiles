{inputs, ...}: {
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    quickCss = builtins.readFile ../../extras/styles/custom.css; #joinked from Nagi :3
    config = {
      frameless = true;
      plugins = {
        hideAttachments.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageLatency.enable = true;
        showHiddenThings.enable = true;
        showMeYourName.enable = true;
      };
    };
  };
}
