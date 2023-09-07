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
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs dependencies.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astronvim = { url = "github:AstroNvim/AstroNvim/v3.36.3"; flake = false; };
    base16-alacritty = { url = "github:aarowill/base16-alacritty"; flake = false; };
    base16-fzf = { url = "github:tinted-theming/base16-fzf"; flake = false; };
    base16-shell = { url = "github:tinted-theming/base16-shell"; flake = false; };
    oh-my-tmux = { url = "github:gpakosz/.tmux"; flake = false; };
    oh-my-zsh = { url = "github:ohmyzsh/ohmyzsh"; flake = false; };

    catppuccin-cava = {
      url = "github:catppuccin/cava";
      flake = false;
    };
  };

  outputs = inputs @ { 
      self
    , nixos
    , nixpkgs
    , nixos-unstable
    , nixos-hardware
    , nixpkgs-darwin
    , nixpkgs-unstable
    , home-manager
    , ...
    }:
    let
      username = "jferrara";
      userfullname = "Jamiro Ferrara";
      useremail = "ferrarajamiro@hotmail.com";
      x64_system = "x86_64-linux";

      nixosSystem = import ./modules/lib/nixosSystem.nix;

      macbook_hypr_modules = {
        nixos-modules = [
          ./modules/hardware/macbook.nix
          ./modules/core-desktop.nix

          ./home/zsh.nix
          ./modules/hyprland/default.nix
        ];
        home-module = import ./home/home.nix;
      };

      x64_specialArgs =
      {
        inherit username userfullname useremail;
        pkgs-unstable = import nixpkgs-unstable {
          system = x64_system; # refer the `system` parameter form outer scope recursively
            config.allowUnfree = true;
        };
      }
      // inputs;
      in {
        nixosConfigurations = let
          base_args = {
            inherit home-manager;
            nixpkgs = nixpkgs; # or nixpkgs-unstable
            system = x64_system;
            specialArgs = x64_specialArgs;
          };
        in {
          jferrara = nixosSystem (macbook_hypr_modules // base_args);
        };
};
}

