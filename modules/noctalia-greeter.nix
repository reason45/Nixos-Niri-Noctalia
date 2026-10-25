
{ pkgs, ... }:

{
  services.displayManager.noctalia-greeter = {
    enable = true;

    passwordless-sync-users = [ "sanzay" ];

    settings = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        path = pkgs.bibata-cursors;
      };
    };
  };
}
