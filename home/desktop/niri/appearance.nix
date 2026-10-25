{ pkgs, ... }:
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

  # Qt apps are themed through qt6ct, which Noctalia fills in.
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };
}