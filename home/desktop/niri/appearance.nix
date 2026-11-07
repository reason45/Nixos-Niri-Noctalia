{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    glib
    adw-gtk3
    kdePackages.qt6ct
    tela-icon-theme
  ];

  # Fonts and icons only. Noctalia controls the GTK theme and light/dark mode.
  dconf.settings."org/gnome/desktop/interface" = {
    font-name = "Inter 12";
    document-font-name = "Inter 12";
    monospace-font-name = "JetBrainsMono Nerd Font 12";
    icon-theme = "Tela-dark";
  };

  # Privacy settings carried over from the GNOME config (honoured by GTK apps).
  dconf.settings."org/gnome/desktop/privacy" = {
    remember-recent-files = false;
    remove-old-trash-files = true;
    remove-old-temp-files = true;
    old-files-age = lib.hm.gvariant.mkUint32 5;
  };

  # Qt apps are themed through qt6ct, which Noctalia fills in.
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };
}