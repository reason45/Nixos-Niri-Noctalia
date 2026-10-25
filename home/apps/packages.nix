{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # CLI
    wl-clipboard
    btop
    ripgrep
    fd

    # Desktop apps
    imv
    mpv
    papers
    mousepad
    bitwarden-desktop
    libreoffice
    file-roller
    gnome-calculator
  ];
}
