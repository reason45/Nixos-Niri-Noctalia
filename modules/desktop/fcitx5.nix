# Input method (Nepali/Devanagari via m17n). Started by the session's XDG
# autostart; Noctalia themes it through its fcitx5 template.
{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [ fcitx5-m17n ];
    };
  };
}
