# Niri scrolling window manager.
# programs.niri.{enable,package} are official nixpkgs options.
# Config: niri reads $XDG_CONFIG_HOME/niri/config.kdl first; we also ship
# under /etc/xdg/niri so it is available system-wide via XDG_CONFIG_DIRS.
{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.unstable.niri;
  };

  environment.etc."xdg/niri/config.kdl".source = ./niri.kdl;
}
