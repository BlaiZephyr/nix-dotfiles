{ pkgs, ...}:

let
    audiorelay = import ../../package.nix { inherit pkgs; };
in {
    environment.systemPackages = with pkgs; [ audiorelay ];
}