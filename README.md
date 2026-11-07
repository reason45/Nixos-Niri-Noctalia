<div align="center">

# ❄️ sanzay

**Pure NixOS flake for a Dell Latitude 5410**  
Niri · Noctalia · Noctalia Greeter · Firefox · fully declarative, no Home Manager, no nh

![NixOS](https://img.shields.io/badge/NixOS-26.05-5277C3?logo=nixos&logoColor=white)
![Compositor](https://img.shields.io/badge/Niri-scrolling%20WM-89b4fa)
![Flakes](https://img.shields.io/badge/Flakes-enabled-cba6f7)

</div>

---

## Layout

```text
.
├── flake.nix                 # inputs + nixosConfigurations.sanzay
├── flake.lock
├── configuration.nix         # hostname, stateVersion, imports modules + hardware
├── hardware-configuration.nix
├── Assets/
│   ├── fonts/                # Kalimati, Preeti, Kantipur (localFont packages)
│   └── wallpapers/           # source of truth; activation symlinks into ~/Pictures/Wallpapers
└── modules/
    ├── default.nix           # imports everything below
    ├── system/               # boot, nix(+gc), locale, users, networking, services, fonts, fcitx5
    ├── system-hardware/      # graphics, intel, memory, audio, laptop
    ├── desktop/              # niri, noctalia, greeter, assets activation
    └── apps/                 # packages, bash, starship, git, fastfetch, firefox, mpv, mimeapps
```

## Daily usage

```bash
# From the flake directory (e.g. /etc/nixos):
rebuild          # sudo nixos-rebuild switch --flake .#sanzay
rebuild-boot     # write new generation, activate on next boot
rebuild-test     # activate without making it the boot default
rebuild-check    # build only

clean            # sudo nix-collect-garbage --delete-older-than 7d
clean-all        # sudo nix-collect-garbage -d
```

## Notes

- **Hostname / username**: `sanzay`
- **Home Manager**: fully removed
- **nh**: fully removed — use `nixos-rebuild` and `nix-collect-garbage`
- **Wallpapers**: `Assets/wallpapers` → activation symlinks into `/home/sanzay/Pictures/Wallpapers`
- **Fonts**: `Assets/fonts` via `localFont` in `modules/system/fonts.nix`
- **Flake inputs**: `nixpkgs` (26.05), `nixpkgs-unstable`, `noctalia`, `noctalia-greeter`
- **Greeter**: project flake module (`passwordless-sync-users`, `settings.cursor.path`)
- **Secure Boot**: Limine + sbctl — enrol keys *before* enabling `secureBoot`
- **Memory**: zram (50 %) + 4 GiB swapfile + earlyoom

## First rebuild

1. Place this tree at `/etc/nixos` (or keep the flake path you prefer).
2. `nix flake update` (adds the `noctalia` input; old lock only had greeter).
3. `sudo nixos-rebuild switch --flake .#sanzay`
4. Log out / reboot and check `~/Pictures/Wallpapers`.
