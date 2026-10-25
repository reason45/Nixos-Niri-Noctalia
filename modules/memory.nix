
# Memory tuning for 8 GB of RAM: compressed RAM swap, swap behaviour, and
# early OOM handling to help keep the desktop responsive under memory pressure.
{ ... }:
{
  # zram: compressed swap in RAM. No disk swap device is currently active.
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 100; # Allow the kernel to use zram readily.
    "vm.page-cluster" = 0; # Disable swap readahead.
  };

  # Terminates processes under severe memory pressure to reduce the risk
  # of the system becoming unresponsive.
  services.earlyoom = {
    enable = true;
    enableNotifications = true;
  };
}

