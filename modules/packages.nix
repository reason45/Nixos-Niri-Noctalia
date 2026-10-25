# System-wide basics only. Apps you use yourself belong in ../home/packages.nix.
{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    preferences = {
      # Use the Intel GPU for video decoding (see graphics.nix).
      "media.ffmpeg.vaapi.enabled" = true;
    };
  };

  environment.systemPackages = with pkgs; [
    git
    mousepad
    mpv
    imv
    papers
  ];
}
