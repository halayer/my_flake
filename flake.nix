{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... } @ inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      extraArgs = { inherit inputs; };
      # args = { inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
