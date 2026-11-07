# System-wide packages used by the desktop and daily apps.
# (No Home Manager — everything lands in environment.systemPackages.)
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Terminal & shell helpers
    alacritty
    bat
    fd
    ripgrep
    fzf
    jq

    # File manager & viewers
    nautilus
    imv
    papers          # PDF (Evince fork / GNOME Papers)
    mousepad
    file-roller

    # Office
    libreoffice

    # Media
    mpv

    # System / utilities
    fastfetch
    btop
    unzip
    wl-clipboard
    xdg-utils
    git

    # Cursors used by greeter / niri
  ];
}
