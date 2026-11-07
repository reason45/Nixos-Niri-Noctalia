# GTK / Qt / cursor baseline (pure NixOS — no Home Manager).
# Noctalia still owns live palette via theme templates (gtk3/gtk4/qt).
# This layer provides:
#   - dconf prefer-dark for libadwaita / GTK apps
#   - theme packages (adw-gtk3, Papirus, Bibata, qt6ct)
# Cursor matches the greeter (Bibata-Modern-Ice).
{ pkgs, ... }:
{
  programs.dconf.enable = true;

  programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "adw-gtk3-dark";
        icon-theme = "Papirus-Dark";
        cursor-theme = "Bibata-Modern-Ice";
        cursor-size = 20;
      };
    }
  ];

  environment.systemPackages = with pkgs; [
    adw-gtk3
    papirus-icon-theme
    bibata-cursors
    kdePackages.qt6ct
  ];

  # Session cursor size/name (greeter sets its own; this helps the desktop).
  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "20";
  };

  # Intentionally not enabling qt.{enable,platformTheme,style}:
  # niri already sets QT_QPA_PLATFORMTHEME=qt6ct and Noctalia templates Qt.
}
