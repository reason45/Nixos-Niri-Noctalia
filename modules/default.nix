# Shared system modules, grouped by purpose.
{ ... }:
{
  imports = [
    # core
    ./core/boot.nix
    ./core/nix.nix
    ./core/locale.nix
    ./core/users.nix
    ./core/networking.nix
    ./core/services.nix

    # hardware
    ./hardware/graphics.nix
    ./hardware/intel.nix
    ./hardware/memory.nix
    ./hardware/audio.nix
    ./hardware/laptop.nix

    # desktop
    ./desktop/fonts.nix
    ./desktop/fcitx5.nix
    ./desktop/common.nix
    ./desktop/niri.nix
    ./desktop/greeter.nix
  ];
}
