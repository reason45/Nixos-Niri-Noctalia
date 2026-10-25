{ ... }:
{
  # Home Manager inherits the system package set via home-manager.useGlobalPkgs.
  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;

  nix.settings = {
    # This is a non-flake configuration; flakes are not enabled.
    experimental-features = [ "nix-command" "flakes" ];

    # Keep big rebuilds from running out of memory on an 8 GB machine.
    cores = 4;
    max-jobs = 2;
  };

  # Run the Nix daemon at idle priority so rebuilds don't make the desktop lag.
  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  # Weekly cleanup keeps the store from accumulating unreferenced downloads.
  # It does NOT delete system generations/GC roots, so rollback remains available.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Store optimisation deduplicates identical files in the Nix store.
  # It saves disk space, not RAM, and may briefly use CPU/disk while running.
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
}
