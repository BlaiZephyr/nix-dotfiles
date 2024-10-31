{...}: {
  programs.nixcord = {
    enable = true;
    frameless = true;
    plugins = {
      memberCount = true;
      mentionAvatars = true;
      messageLatency = true;
      showHiddenThings = true;
      showMeYourName = true;
    };

    quickCss = builtins.readFile ../../extras/styles/custom.css; #joinked from Nagi :3
  };
}
