{ config
, lib
, ...
}:
let
  inherit (lib.modules) mkAliasOptionModule;

  username = "melonix";
in
{
  imports = [
    (mkAliasOptionModule [ "hm" ] [ "home-manager" "users" username ])
    (mkAliasOptionModule [ "primaryUser" ] [ "users" "users" username ])
  ];

  config = {
    primaryUser = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" "video" "input" "dialout" ];
    };
    nix.settings.trusted-users = [ username ];

    hm = {
      home.homeDirectory = config.users.users."${username}".home;
      programs.home-manager.enable = true;
      home.username = username;

      home.stateVersion = config.system.stateVersion;
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}