{ lib, ... }:

let
  # Map one app to many MIME types.
  assign = app: types: lib.genAttrs types (_: app);

  firefox = "firefox.desktop";
  papers = "org.gnome.Papers.desktop";
  mousepad = "org.xfce.mousepad.desktop";
  nautilus = "org.gnome.Nautilus.desktop";
  imv = "imv.desktop";
  mpv = "mpv.desktop";
  roller = "org.gnome.FileRoller.desktop";
  writer = "writer.desktop";
  calc = "calc.desktop";
  impress = "impress.desktop";
in
{
  xdg.mimeApps = {
    enable = true;

    defaultApplications =
      # Web
      assign firefox [
        "text/html"
        "application/xhtml+xml"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
        "x-scheme-handler/about"
        "x-scheme-handler/unknown"
        "image/svg+xml"
      ]

      # PDF
      // assign papers [ "application/pdf" ]

      # File manager
      // assign nautilus [ "inode/directory" ]

      # Text and code
      // assign mousepad [
        "text/plain"
        "text/markdown"
        "application/json"
        "application/x-shellscript"
        "text/x-python"
      ]

      # Images
      // assign imv [
        "image/png"
        "image/jpeg"
        "image/webp"
        "image/gif"
        "image/tiff"
        "image/bmp"
        "image/avif"
      ]

      # Video and audio
      // assign mpv [
        "video/mp4"
        "video/webm"
        "video/x-matroska"
        "video/ogg"
        "video/x-msvideo"
        "video/quicktime"
        "audio/mpeg"
        "audio/ogg"
        "audio/flac"
        "audio/x-flac"
        "audio/wav"
        "audio/x-wav"
        "audio/mp4"
        "audio/aac"
        "audio/opus"
      ]

      # Office: documents
      // assign writer [
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        "application/vnd.oasis.opendocument.text"
        "application/msword"
        "application/rtf"
      ]

      # Office: spreadsheets
      // assign calc [
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        "application/vnd.oasis.opendocument.spreadsheet"
        "application/vnd.ms-excel"
        "text/csv"
      ]

      # Office: presentations
      // assign impress [
        "application/vnd.openxmlformats-officedocument.presentationml.presentation"
        "application/vnd.oasis.opendocument.presentation"
        "application/vnd.ms-powerpoint"
      ];
  };
}