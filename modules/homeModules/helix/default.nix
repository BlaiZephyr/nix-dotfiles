{
  lib,
  config,
  inputs,
  ...
}: {
  options.hm = {
    helix.enable = lib.mkEnableOption "enable helix";
  };

  imports = [
    ./languages
    ./config
  ];

  config = lib.mkIf config.hm.helix.enable {
    nixpkgs = {
      overlays = [inputs.helix-overlay.overlays.default];
    };

    programs.helix = {
      enable = true;
    };
  };
}
