# Machine entry point for the single laptop (Dell Latitude 5410).
# Imports hardware scan + the shared module tree under ./modules.
{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  networking.hostName = "sanzay";

  # Keep at the NixOS release used when the system was first installed.
  # Bump only after reading the release notes and testing a rebuild.
  system.stateVersion = "26.05";
}
