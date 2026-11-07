{
  description = "Sanzay's pure NixOS flake (Niri + Noctalia, no Home Manager)";

  inputs = {
    # Stable channel for the base system.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Unstable for newer desktop packages (niri, noctalia, etc.).
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Noctalia shell (NixOS module + package).
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      # Follow unstable so the module and package stay in sync with bleeding-edge deps.
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Greeter tightly coupled with Noctalia (greetd frontend).
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, noctalia, noctalia-greeter, ... }:
    let
      system = "x86_64-linux";

      # Overlay that exposes pkgs.unstable.<pkg> everywhere.
      unstableOverlay = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in
    {
      # Attribute name == networking.hostName, so
      #   nixos-rebuild switch --flake .
      # picks it automatically.
      nixosConfigurations.sanzay = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          # Make the unstable overlay available to every module.
          { nixpkgs.overlays = [ unstableOverlay ]; }

          # Machine entry point (hostname, stateVersion, hardware, modules).
          ./configuration.nix

          # Noctalia greeter NixOS module (from the greeter flake).
          noctalia-greeter.nixosModules.default
        ];
      };
    };
}
