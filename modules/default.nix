# Shared system modules, grouped by purpose.
# Every path is relative to this file (modules/).
{ ... }:
{
  imports = [
    # ── system (core OS settings) ──────────────────────────────────────────
    ./system/boot.nix
    ./system/nix.nix
    ./system/locale.nix
    ./system/users.nix
    ./system/networking.nix
    ./system/services.nix
    ./system/fonts.nix
    ./system/fcitx5.nix

    # ── system-hardware (machine-specific hardware) ────────────────────────
    ./system-hardware/graphics.nix
    ./system-hardware/intel.nix
    ./system-hardware/memory.nix
    ./system-hardware/audio.nix
    ./system-hardware/laptop.nix

    # ── desktop (compositor + shell + greeter) ─────────────────────────────
    ./desktop/niri.nix
    ./desktop/noctalia.nix
    ./desktop/greeter.nix
    ./desktop/assets.nix          # wallpapers/fonts activation from Assets/
    ./desktop/theming.nix         # GTK/Qt/cursor baseline (dconf + packages)

    # ── apps (system-wide programs & defaults) ─────────────────────────────
    ./apps/packages.nix
    ./apps/bash.nix
    ./apps/starship.nix
    ./apps/github.nix             # git identity
    ./apps/fastfetch.nix
    ./apps/firefox.nix
    ./apps/mpv.nix
    ./apps/mimeapps.nix
  ];
}
