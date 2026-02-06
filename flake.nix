{
  # to rewrite and set afterwards
  #description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.11";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin, ... }: 
  let

    mkHomeModule = host: {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.rain.imports = [ ./hosts/${host}/home.nix ];
      };
    };

  in
  {

    nixosConfigurations = {
      laptop= nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	modules = [ 
	  ./hosts/laptop

	  home-manager.nixosModules.home-manager (mkHomeModule "laptop") 
	];
      };
    };

    darwinConfigurations = {
      macbook = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
	modules = [ 
	  ./hosts/macbook 

	  home-manager.darwinModules.home-manager (mkHomeModule "macbook") 
	];
      };
    }; 
  };
}
