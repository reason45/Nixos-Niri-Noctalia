{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./appearance.nix
    ../Noctalia
  ];

  home.packages = with pkgs; [
    alacritty
    nautilus
    playerctl
    papers
    xwayland
    xwayland-satellite
    
  ];
}
