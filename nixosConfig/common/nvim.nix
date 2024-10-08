{
  inputs,
  lib,
  pkgs,
  ... 
}: {
  imports = [inputs.nixvim.nixosModules.nixvim];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    enableMan = false;

    extraPackages = with pkgs; [
      fd
      ripgrep
    ];
    opts = {
      title = true;

      expandtab = true; #convert tabs to spaces
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;

      wrap = true; # override mini-basics
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };


  };
 }