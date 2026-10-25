{ pkgs, ... }:
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
}
