# Laptop services: battery, power profiles, Bluetooth, firmware updates, SSD TRIM.
# Power profiles are used by the GNOME power menu.
{ ... }:
{
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  hardware.bluetooth.enable = true;
  services.fwupd.enable = true; # Dell BIOS/firmware updates: fwupdmgr update
  services.fstrim.enable = true; # weekly TRIM for the SSD
}
