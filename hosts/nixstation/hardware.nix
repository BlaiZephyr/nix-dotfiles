{ config
, lib
, modulesPath
, ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "sd_mod"
      ];
      kernelModules = [ ];
      luks.devices = {
        "luks-8941ac93-f043-46d1-b128-37d5e846303f".device = "/dev/disk/by-uuid/8941ac93-f043-46d1-b128-37d5e846303f";
      };
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/8bac633b-c4e6-44bc-83b3-97b5472594e8";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/BC0C-F843";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
    "/home/zaney/BFD" = {
      device = "/dev/disk/by-uuid/5A30E2CC30E2AE67";
      fsType = "ntfs";
      options = [
        "defaults"
        "umask=000"
        "dmask=027"
        "fmask=137"
        "uid=1000"
        "gid=1000"
        "windows_names"
      ];
    };
  };
  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
