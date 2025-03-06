{ ... }:

{
  # Only enable either docker or podman -- Not both
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = false;
}
