{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      nerd-fonts.meslo-lg
      nerd-fonts.jetbrains-mono
      inter
    ];
    fontconfig.defaultFonts = {
      sansSerif = [ "Inter" "Noto Sans" "Noto Sans Devanagari" ];
      serif = [ "Noto Serif" "Noto Serif Devanagari" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Sans Mono" "Noto Sans Devanagari" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
