# Noctalia greeter (greetd frontend).
# Module comes from the noctalia-greeter flake (project module, not nixpkgs).
# Option names: passwordless-sync-users (kebab), settings.cursor.path, etc.
# Docs: https://docs.noctalia.dev/greeter/installation/
{ pkgs, ... }:
{
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordless-sync-users = [ "sanzay" ];

    settings = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 20;
        path = pkgs.bibata-cursors;
      };
      # Open the password step for this account on startup.
      user.default = "sanzay";
      session.default = "niri";
    };
  };
}
