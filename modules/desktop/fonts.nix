{ pkgs, lib, ... }:
let
  # Wrap a local font file (kept in ./fonts) as a font package.
  # Works for .ttf and .otf. The files must exist and be `git add`ed,
  # or the flake build fails.
  localFont = name: file:
    let
      fileName = baseNameOf file;
      ext = lib.toLower (lib.last (lib.splitString "." fileName));
      dir = if ext == "otf" then "opentype" else "truetype";
    in
    pkgs.runCommand "${name}-font" { } ''
      install -Dm644 ${file} $out/share/fonts/${dir}/${fileName}
    '';
in
{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      nerd-fonts.meslo-lg
      nerd-fonts.jetbrains-mono
      inter

      # Office compatibility (metric-compatible with Microsoft fonts)
      liberation_ttf # Arial, Times New Roman, Courier New
      carlito        # Calibri
      caladea        # Cambria

      # Nepali: Kalimati is Unicode; Preeti and Kantipur are legacy
      # ASCII-mapped fonts, so select them by name in documents.
      # Match these file names exactly to the files in ./fonts.
      (localFont "kalimati" ./fonts/Kalimati.otf)
      (localFont "preeti" ./fonts/Preeti.otf)
      (localFont "kantipur" ./fonts/Kantipur.otf)
    ];

    # Preeti/Kantipur are intentionally NOT in these defaults: they would
    # turn normal text into garbage. Noto Sans Devanagari stays the fallback.
    fontconfig.defaultFonts = {
      sansSerif = [ "Inter" "Noto Sans" "Noto Sans Devanagari" ];
      serif = [ "Noto Serif" "Noto Serif Devanagari" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Sans Mono" "Noto Sans Devanagari" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
