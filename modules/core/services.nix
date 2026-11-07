# Small system services carried over from the GNOME config.
{ ... }:
{
  services.printing.enable = true;  # CUPS
  programs.nix-ld.enable = true;    # run unpatched binaries (VS Code server, pip wheels...)

  services.journald.extraConfig = ''
    SystemMaxUse=200M
  '';
}
