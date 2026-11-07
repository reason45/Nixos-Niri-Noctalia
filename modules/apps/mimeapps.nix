# Default applications via a system-wide mimeapps.list.
# (No Home Manager xdg.mimeApps — this is pure NixOS.)
{ lib, ... }:
let
  # Helper: one desktop file → many MIME types.
  assign = app: types: lib.concatMapStrings (t: "${t}=${app}\n") types;

  firefox  = "firefox.desktop";
  papers   = "org.gnome.Papers.desktop";
  mousepad = "org.xfce.mousepad.desktop";
  nautilus = "org.gnome.Nautilus.desktop";
  imv      = "imv.desktop";
  mpv      = "mpv.desktop";
  roller   = "org.gnome.FileRoller.desktop";
  writer   = "writer.desktop";
  calc     = "calc.desktop";
  impress  = "impress.desktop";
in
{
  environment.etc."xdg/mimeapps.list".text = ''
    [Default Applications]
    ${assign firefox [
      "text/html"
      "application/xhtml+xml"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/about"
      "x-scheme-handler/unknown"
      "image/svg+xml"
    ]}
    ${assign papers [ "application/pdf" ]}
    ${assign nautilus [ "inode/directory" ]}
    ${assign mousepad [
      "text/plain"
      "text/markdown"
      "application/json"
      "application/x-shellscript"
      "text/x-python"
    ]}
    ${assign imv [
      "image/png" "image/jpeg" "image/webp" "image/gif"
      "image/tiff" "image/bmp" "image/avif"
    ]}
    ${assign mpv [
      "video/mp4" "video/webm" "video/x-matroska" "video/ogg"
      "video/x-msvideo" "video/quicktime"
      "audio/mpeg" "audio/ogg" "audio/flac" "audio/x-flac"
      "audio/wav" "audio/x-wav" "audio/mp4" "audio/aac" "audio/opus"
    ]}
    ${assign writer [
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      "application/vnd.oasis.opendocument.text"
      "application/msword"
      "application/rtf"
    ]}
    ${assign calc [
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      "application/vnd.oasis.opendocument.spreadsheet"
      "application/vnd.ms-excel"
      "text/csv"
    ]}
    ${assign impress [
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      "application/vnd.oasis.opendocument.presentation"
      "application/vnd.ms-powerpoint"
    ]}
  '';
}
