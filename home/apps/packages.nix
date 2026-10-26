{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    ripgrep
    fd
    # Desktop apps
    imv
    mpv
    papers
    mousepad
    bitwarden-desktop
    libreoffice
  ];
}
