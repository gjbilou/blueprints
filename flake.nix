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
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin, nixvim, ... }: 
  let

    mkHomeModule = host: {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.rain.imports = [ 
	  ./hosts/${host}/home.nix 

	  nixvim.homeModules.nixvim
	];
      };
    };

  in
  {

    nixosConfigurations = {
      nixy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	modules = [ 
	  ./hosts/nixy

	  home-manager.nixosModules.home-manager (mkHomeModule "nixy") 
	];
      };
    };

    darwinConfigurations = {
      maccy = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
	modules = [ 
	  ./hosts/maccy

	  home-manager.darwinModules.home-manager (mkHomeModule "maccy") 
	];
      };
    }; 
  };
}
