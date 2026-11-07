# Assets/ is the source of truth for wallpapers (and fonts are handled in fonts.nix).
# On every activation we ensure ~/Pictures/Wallpapers contains symlinks to the
# store copies of Assets/wallpapers so Noctalia and the user always see them.
{ config, lib, pkgs, ... }:
let
  wallpapersSrc = ../../Assets/wallpapers;
  user = "sanzay";
  homeDir = "/home/${user}";
  targetDir = "${homeDir}/Pictures/Wallpapers";
in
{
  # Make the raw Assets available under /etc as well (handy for greeter / scripts).
  environment.etc."wallpapers".source = wallpapersSrc;

  system.activationScripts.sanzayWallpapers = {
    text = ''
      echo "Syncing wallpapers from Assets/ into ${targetDir} ..."
      mkdir -p "${targetDir}"
      # Symlink every file from the store copy; -sfn replaces stale links.
      for f in ${wallpapersSrc}/*; do
        [ -e "$f" ] || continue
        ln -sfn "$f" "${targetDir}/$(basename "$f")"
      done
      # Ensure ownership so the user can read/write the directory itself.
      chown -R ${user}:users "${homeDir}/Pictures" 2>/dev/null || true
    '';
    deps = [ "users" ];
  };
}
