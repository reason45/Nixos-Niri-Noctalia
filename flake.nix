{
  description = "Sanzay's NixOS + standalone Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      # Reuse our unstable nixpkgs instead of fetching a third copy.
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, noctalia-greeter, ... }:
    let
      system = "x86_64-linux";

      # Exposes `pkgs.unstable.<name>` to both NixOS and Home Manager.
      unstableOverlay = final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      # Package set for standalone Home Manager.
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ unstableOverlay ];
      };
    in
    {
      # Name matches networking.hostName, so `nixos-rebuild switch --flake .`
      # (or `nh os switch`) picks it automatically.
      nixosConfigurations."Latitude-5410" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          { nixpkgs.overlays = [ unstableOverlay ]; }
          ./hosts/latitude-5410
          noctalia-greeter.nixosModules.default
        ];
      };

      homeConfigurations.sanzay = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home
          {
            home.username = "sanzay";
            home.homeDirectory = "/home/sanzay";
          }
        ];
      };
    };
}
