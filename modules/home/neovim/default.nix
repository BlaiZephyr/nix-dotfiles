{
  inputs,
  lib,
  config,
  ...
}: {
  options.hm = {
    neovim.enable = lib.mkEnableOption "enables neovim";
  };

  imports = [
    ./plugins
    inputs.nvf.homeManagerModules.default
  ];
  config = lib.mkIf config.hm.neovim.enable {
    programs.nvf = {
      enable = true;
    };
  };
}
