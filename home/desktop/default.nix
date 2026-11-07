{ config, pkgs, ... }:
{
  imports = [
    ./niri
    ./noctalia
  ];

  home.packages = with pkgs; [
    alacritty
    nautilus
    playerctl
    xwayland
    xwayland-satellite
  ];

  # Defined once here; the login greeter has its own copy in modules/desktop/greeter.nix.
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
  };
  
  # Nautilus sidebar bookmarks (same list as the GNOME config).
  xdg.configFile."gtk-3.0/bookmarks".text = ''
    file:///etc/nixos Nixos
    file://${config.home.homeDirectory}/Desktop
    file://${config.home.homeDirectory}/Documents
    file://${config.home.homeDirectory}/Music
    file://${config.home.homeDirectory}/Pictures
    file://${config.home.homeDirectory}/Videos
    file://${config.home.homeDirectory}/Downloads
  '';

  # Wallpapers addon
  home.file."Pictures/Wallpapers" = { source = ./wallpapers;  recursive = true; };
  home.file."Pictures/Screenshots/.keep".text = "";
  }
