{ pkgs, ... }:
{
  home.packages = with pkgs; [
  wl-clipboard
  btop
  ripgrep
  fd

  # Password manager, office suite, archive manager, calculator
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
