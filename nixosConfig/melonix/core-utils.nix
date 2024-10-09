{pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        xfce.thunar
        xfce.thunar-volman
        nix-output-monitor
        nvd
        davinci-resolve
        clinfo
    ];
}