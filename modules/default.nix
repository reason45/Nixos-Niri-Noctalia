{ ... }:
{
  imports = [
    ./boot.nix
    ./nix.nix
    ./locale.nix
    ./users.nix
    ./networking.nix
    ./fonts.nix
    ./packages.nix
    ./graphics.nix
    ./intel.nix
    ./memory.nix
    ./audio.nix
    ./laptop.nix
    ./fcitx5.nix
    ./desktop-common.nix
    ./niri-noctalia.nix
    ./noctalia-greeter.nix
    ./xdg-portals.nix

    # Home Manager is integrated into nixos-rebuild.
    ./home-manager.nix
  ];
}
