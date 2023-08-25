{
  description = "flake for nixos with Home Manager enabled";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
      nixosConfigurations = (
        import ./packages.nix { inherit inputs nixpkgs home-manager; }
      );    
  };
}
