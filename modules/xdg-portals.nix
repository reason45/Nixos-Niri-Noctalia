# Add xdg portal
{ pkgs, ... }:
{
xdg.portal = {
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
  ];
};
}
