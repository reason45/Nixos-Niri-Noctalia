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
    localsend # send files to and from a phone
  ];
}
