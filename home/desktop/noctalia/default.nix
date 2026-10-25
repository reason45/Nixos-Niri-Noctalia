{ config, lib, pkgs, ... }:

let
  home = config.home.homeDirectory;

  tomlFiles = lib.filterAttrs
    (name: type: type == "regular" && lib.hasSuffix ".toml" name)
    (builtins.readDir ./.);

  # These fragments are already valid TOML. Concatenate them instead of
  # parsing and re-serializing them, since this Nixpkgs version's TOML format
  # helper does not expose a `generate` function.
  configText = builtins.concatStringsSep "\n\n"
    (map
      (name: builtins.replaceStrings [ "@home@" ] [ home ]
        (builtins.readFile (./. + "/${name}")))
      (builtins.attrNames tomlFiles));

  configToml = pkgs.writeText "noctalia-config.toml" configText;
in
{
  xdg.configFile."noctalia/noctalia-config.toml".source = configToml;
}
