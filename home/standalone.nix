# Optional standalone Home Manager entry point for non-NixOS Linux.
# Do not use this entry point for the NixOS-managed setup; use configuration.nix.
# Example: home-manager switch -b backup -f ~/nixos/home/standalone.nix
{ ... }:
{
  imports = [ ./default.nix ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;
}
