{ config, lib, pkgs, ... }:
let
  home = config.home.homeDirectory;

  tomlFiles = lib.filterAttrs
    (name: type: type == "regular" && lib.hasSuffix ".toml" name)
    (builtins.readDir ./.);
in
{
  xdg.configFile = lib.mapAttrs'
    (name: _: lib.nameValuePair "noctalia/${name}" {
      source = pkgs.writeText "noctalia-${name}" (
        builtins.replaceStrings [ "@home@" ] [ home ] (builtins.readFile (./. + "/${name}"))
      );
    })
    tomlFiles;
}
