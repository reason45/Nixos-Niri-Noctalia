{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.unstable.niri;
  };

  environment.systemPackages = [
    pkgs.unstable.noctalia
  ];
}
