{ ... }:
{
  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 4;
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    # 0 = boot straight into the default entry. Dual-boot note: hold Space
    # during startup to get the boot menu (e.g. to pick Windows).
    timeout = 0;
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
