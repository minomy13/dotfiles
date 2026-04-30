{
  description = "Adrian's NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-silicon-support = {
      url = "github:nix-community/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    m1-firmware = {
      url = "/boot/asahi";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/pc/config.nix
            ./modules
          ];
        };

        m1 = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/m1/config.nix
            ./modules
          ];
        };
      };
    };
}
