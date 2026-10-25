
{
  imports = [
    ./shell.nix
    ./starship.nix
    ./git.nix
    ./fastfetch.nix
    ./packages.nix
    ./niri/niri.nix
    ./mimeapps.nix
  ];

  # Preserve the Home Manager state version.
  home.stateVersion = "26.05";
}
