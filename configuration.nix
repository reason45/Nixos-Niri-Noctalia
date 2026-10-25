# System entry point: generated hardware settings + local modules + Home Manager channel.
{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  # Keep this at the version used when the system was first installed.
  system.stateVersion = "26.05";
}
