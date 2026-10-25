# Plumbing every desktop (and Home Manager) relies on.
# Portals and gnome-keyring are already enabled by programs.niri.
{ ... }:
{
  programs.dconf.enable = true;            # lets Home Manager dconf settings reach GTK apps
  services.accounts-daemon.enable = true;  # user avatars on greeters
  services.gvfs.enable = true;             # trash, mounts, network places in Nautilus
  security.polkit.enable = true;
  services.udisks2.enable = true;
}
