# ibus for GNOME (Wayland/X11). Nepali via m17n.
# NixOS sets GTK_IM_MODULE / QT_IM_MODULE / XMODIFIERS and autostarts ibus-daemon.
# The GNOME input-source list (top-bar switcher) is set in ../home/gnome.nix.
{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ m17n ];
  };

  # Preload engines for every user. Check exact names with `ibus list-engine`
  # and adjust (unknown names are ignored).
  programs.dconf.profiles.user.databases = [
    {
      settings."desktop/ibus/general".preload-engines = [
        "xkb:us::eng"
        "m17n:ne:trad-ttf"
      ];
    }
  ];
}
