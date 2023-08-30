{
  description = "My NixOS configuration: A Mix of Nix and Max";

  inputs = {
    nixos.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";
    disko.url = "github:nix-community/disko/v1.0.0";
    disko.inputs.nixpkgs.follows = "nixos";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixos";

    asdf-kubectl = { url = "github:asdf-community/asdf-kubectl"; flake = false; };
    asdf-kustomize = { url = "github:Banno/asdf-kustomize"; flake = false; };
    astronvim = { url = "github:AstroNvim/AstroNvim/v3.36.3"; flake = false; };
    base16-alacritty = { url = "github:aarowill/base16-alacritty"; flake = false; };
    base16-fzf = { url = "github:tinted-theming/base16-fzf"; flake = false; };
    base16-shell = { url = "github:tinted-theming/base16-shell"; flake = false; };
    oh-my-tmux = { url = "github:gpakosz/.tmux"; flake = false; };
    oh-my-zsh = { url = "github:ohmyzsh/ohmyzsh"; flake = false; };
  };

  outputs =
    { self
    , nixos
    , nixpkgs
    , nixos-unstable
    , nixos-hardware
    , nixpkgs-darwin
    , nixpkgs-unstable
    , darwin
    , disko
    , home-manager
    , ...
    }@attrs:
    let
      baseModules = [
        ./hardware-configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = false;
          home-manager.users.jferrara = import ./home.nix;
          home-manager.extraSpecialArgs = attrs;
        }
      ];
    in
    {
      nixosConfigurations = (
        import ./packages.nix { inherit nixpkgs home-manager; }
      );    
    };
}

