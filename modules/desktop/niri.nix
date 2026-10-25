# Compositor and shell, taken from unstable. User config lives in home/desktop.
{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.unstable.niri;
  };

  environment.systemPackages = [ pkgs.unstable.noctalia ];
}
