# NetworkManager is the only network backend we need on a laptop.
# Hostname is set in configuration.nix (must match the flake attribute).
{ ... }:
{
  networking.networkmanager.enable = true;
  # Firewall is on by default; open ports here if you ever need them.
  # networking.firewall.allowedTCPPorts = [ ... ];
}
