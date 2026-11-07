# Starship prompt — system-wide, config from the adjacent TOML.
{ ... }:
{
  programs.starship = {
    enable = true;
    # settings can be set inline; we prefer the TOML next to this file.
  };

  # Install the TOML where starship looks by default for all users.
  environment.etc."xdg/starship.toml".source = ./starship.toml;
}
