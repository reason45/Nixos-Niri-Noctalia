{ pkgs, ... }:
{
  # sbctl creates and manages the Secure Boot keys. See the "Secure Boot"
  # section of README.md for the one-time setup order.
  environment.systemPackages = [ pkgs.sbctl ];

  boot.loader = {
    systemd-boot.enable = false;

    limine = {
      enable = true;
      maxGenerations = 4;

      # Signs Limine with the keys in /var/lib/sbctl. The keys must exist and
      # be enrolled BEFORE the rebuild that turns this on, or it fails.
      secureBoot.enable = true;
      style = {
        wallpapers = [];
      };
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    timeout = 3;
  };

  boot.plymouth = {
    enable = true;
    theme = "bgrt";
  };

  # Silent boot
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
  ];
}
