# Nix daemon, flakes, and store maintenance.
# (nh intentionally not used — rebuilds and GC are plain NixOS tools.)
{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    warn-dirty = false;

    # Keep big rebuilds from thrashing an 8 GB machine.
    cores = 4;
    max-jobs = 2;
  };

  # Run the Nix daemon at idle priority so rebuilds do not lag the desktop.
  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  # Automatic garbage collection (replaces what nh clean used to do).
  # Keep generations for 7 days so rollback stays available for about a week.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Deduplicate identical files in the store (saves disk, not RAM).
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
}
