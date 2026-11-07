# Noctalia shell (bar, launcher, notifications, wallpaper, lock).
# Requires the noctalia flake input (see flake.nix).
{ inputs, pkgs, ... }:
{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  programs.noctalia = {
    enable = true;
    # Installs NetworkManager/Bluetooth/UPower/power-profiles helpers if desired.
    # We already enable those in system-hardware/, so leave recommended off
    # or turn on if you prefer the module to own them.
    # recommendedServices.enable = true;
  };

  # Shared default configuration for all users.
  environment.etc."xdg/noctalia/config.toml".source = ./noctalia.toml;
}
