{
  description = "Mein erster flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs , ... } @ inputs: let
    hm = inputs.home-manager;
  in {
    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        hm.nixosModules.default
      ];
    };
  };
}
