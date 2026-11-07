# Plumbing every desktop (and Home Manager) relies on.
# Portals and gnome-keyring are already enabled by programs.niri.
{ ... }:
{
  programs.dconf.enable = true;            # lets Home Manager dconf settings reach GTK apps
  services.accounts-daemon.enable = true;  # user avatars on greeters
  services.gvfs.enable = true;             # trash, mounts, network places in Nautilus
  security.polkit.enable = true;
  services.udisks2.enable = true;

  # Replaces the GNOME GSConnect extension (phone pairing, file sharing).
  # Also opens the 1714-1764 firewall range the GNOME config opened by hand.
  programs.kdeconnect.enable = true;
}
