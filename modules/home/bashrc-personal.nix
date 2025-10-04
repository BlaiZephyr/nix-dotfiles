{ pkgs, ... }: {
  home.packages = with pkgs; [ bash ];

  home.file."./.bashrc-personal".text = ''
     '';
}
