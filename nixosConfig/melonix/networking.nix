{...}: {
  networking.hostName = "melonix";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [80 443];
    allowedUDPPortRanges = [
      {
        from = 8303;
        to = 8304;
      }
      {
        from = 8403;
        to = 8404;
      }
    ];
  };
}
