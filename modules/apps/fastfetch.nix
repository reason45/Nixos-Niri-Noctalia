# Fastfetch system info (package is in packages.nix; config via environment).
{ pkgs, ... }:
{
  # Drop a system-wide config that fastfetch will pick up.
  environment.etc."xdg/fastfetch/config.jsonc".text = builtins.toJSON {
    logo = {
      source = "nixos_small";
      padding = { right = 2; };
    };
    display = {
      separator = "  ";
    };
    modules = [
      "title" "separator"
      "os" "host" "kernel" "uptime" "packages"
      "shell" "de" "wm" "terminal"
      "cpu" "gpu" "memory" "swap" "disk" "locale"
    ];
  };
}
