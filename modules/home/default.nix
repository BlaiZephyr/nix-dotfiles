{pkgs, ... }: {
	imports = [
   ./recording.nix
   ./nh.nix
   ./gaming.nix
   ./social.nix
	 ./home.nix
	 ./terminal.nix
	 ./nvim.nix
   ./work.nix
	];

  programs.git = {
    enable = true;
    userName = "BlaiZepyhr";
    userEmail = "arbeit.t.lechner@gmail.com";
  };

  home.packages = with pkgs; [
    bitwarden-desktop
    bitwarden-cli
  ];
  
}
