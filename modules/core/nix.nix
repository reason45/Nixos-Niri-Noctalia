{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    warn-dirty = false;

    # Keep big rebuilds from running out of memory on an 8 GB machine.
    cores = 4;
    max-jobs = 2;
  };

  # Run the Nix daemon at idle priority so rebuilds don't make the desktop lag.
  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  # nh: nicer rebuild output (`nh os switch`, `nh home switch`) and cleanup.
  # Its weekly clean replaces nix.gc (the two must not both be enabled).
  # Keeps generations from the last 7 days and at least the 3 newest, so
  # rollback is available for about a week.
  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 7d --keep 3";
    };
  };

  # Deduplicate identical files in the store (saves disk, not RAM).
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
}
