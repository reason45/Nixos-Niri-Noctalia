
{ ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.sanzay = {
      imports = [
        ../home
      ];

      home.username = "sanzay";
      home.homeDirectory = "/home/sanzay";

      # Shared settings used by the Niri appearance configuration.
      _module.args.settings = {
        cursor = {
          name = "Bibata-Modern-Ice";
          package = "bibata-cursors";
          size = 24;
        };
      };
    };
  };
}

