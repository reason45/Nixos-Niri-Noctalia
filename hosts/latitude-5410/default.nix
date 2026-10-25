# Machine-specific entry point: hardware scan + hostname + shared modules.
{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "Latitude-5410";

  # Keep at the version used when the system was first installed.
  system.stateVersion = "26.05";
}
