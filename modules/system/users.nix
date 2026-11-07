# Single user on this laptop. No Home Manager — everything is system-wide.
{ ... }:
{
  users.users.sanzay = {
    isNormalUser = true;
    description = "Sanjaya";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "input" ];
    # Default shell is bash (configured in modules/apps/bash.nix).
  };

  # Allow members of wheel to use sudo without re-typing the password for a
  # short window (convenient for rebuilds).
  security.sudo.wheelNeedsPassword = true;
}
