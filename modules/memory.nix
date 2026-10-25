# Memory tuning for 8 GB of RAM: compressed RAM swap, swap behaviour, and an
# early OOM killer so the desktop never freezes when memory runs out.
{ ... }:
{
  # zram: compressed swap in RAM. Much faster than the disk swap partition,
  # which stays in hardware-configuration.nix as a lower-priority fallback.
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 100; # prefer zram over dropping the page cache
    "vm.page-cluster" = 0; # no read-ahead on compressed swap
  };

  # Kills the biggest offender early instead of letting the system lock up.
  services.earlyoom = {
    enable = true;
    enableNotifications = true;
  };
}
