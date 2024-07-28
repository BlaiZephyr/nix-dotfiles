{ ... }: {
	imports = [
    ./steam.nix
    ./drivers.nix
    ./db.nix
    ./dev.nix
	];

    nixpkgs.config.packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}
