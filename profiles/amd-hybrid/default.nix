{ host, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) amdgpuID nvidiaID;

in
{
  imports = [
    ../../hosts/${host}
    ../../modules/drivers
    ../../modules/core
  ];

  # Enable AMD+NVIDIA hybrid drivers (Prime offload with AMD as primary)
  drivers.nvidia-amd-hybrid = {
    enable = true;
    amdgpuBusID = "${amdgpuID}";
    nvidiaBusID = "${nvidiaID}";
  };

  # Ensure other driver toggles are off for this profile
  drivers.amdgpu.enable = false;
  drivers.nvidia.enable = false;
  drivers.nvidia-prime.enable = false;
  drivers.intel.enable = false;

  vm.guest-services.enable = false;
}
