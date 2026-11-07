# Shell helpers carried over from the GNOME config.
# bat lives in bash.nix; ripgrep and fd are in apps/packages.nix.
{ ... }:
{
  programs.fzf.enable = true; # Ctrl+R history search, Ctrl+T file picker

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
