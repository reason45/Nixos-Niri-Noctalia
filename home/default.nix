{ ... }:
{
  imports = [
    ./shell
    ./apps
    ./desktop
  ];

  programs.home-manager.enable = true; # puts the `home-manager` command on PATH

  home.stateVersion = "26.05";
}
