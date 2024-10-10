{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ddnet
  ];
}
