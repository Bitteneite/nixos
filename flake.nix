{
  description = "Bitten's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    
    home-manager = {
     url = "github:nix-community/home-manager/release-23.11";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/laptop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
	  wsl2 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
		system = "x86_64-linux";
        modules = [
          ./hosts/wsl2/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
