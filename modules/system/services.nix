# System services and desktop integration plumbing.
{ ... }:
{
  # Printing (CUPS).
  services.printing.enable = true;

  # Limit journal disk usage on an 8 GB machine.
  services.journald.extraConfig = ''
    SystemMaxUse=200M
  '';

  # Desktop integration.
  programs.dconf.enable = true;
  services.accounts-daemon.enable = true;
  services.gvfs.enable = true;

  # Polkit (needed by Noctalia and file managers) + removable storage.
  security.polkit.enable = true;
  services.udisks2.enable = true;
}
