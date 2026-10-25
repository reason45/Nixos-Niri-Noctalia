# Memory tuning for 8 GB of RAM: zram first, swapfile as overflow,
# and early OOM handling to keep the desktop responsive.
{ ... }:
{
  # Compressed swap in RAM (default priority 5, used before the swapfile).
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  # Disk swap overflow; lower priority than zram. The file must already exist.
  swapDevices = [
    { device = "/swapfile"; priority = 0; }
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 100; # let the kernel use zram readily
    "vm.page-cluster" = 0; # no swap readahead (good for zram)
  };

  # Kills the worst offender under severe memory pressure instead of freezing.
  services.earlyoom = {
    enable = true;
    enableNotifications = true;
  };
}
