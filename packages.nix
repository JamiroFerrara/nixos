{inputs, nixpkgs, home-manager, ...}: {
  jferrara = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./programs/chrome.nix
        ./programs/zsh.nix
        ./programs/grub.nix

        home-manager.nixosModules.home-manager {
          home-manager.users.jferrara = { pkgs, ... }: {
            home.username = "jferrara";
            home.homeDirectory = "/home/jferrara";
            programs.home-manager.enable = true;
            home.packages = with pkgs; [
              cargo
              chromium
              alacritty
              exa
              git
              rofi
              feh
              sxhkd
              neovim
              wget
              curl
              ripgrep
              lazygit
              ranger
              xh
              zsh
              tmux
              bspwm
              gh
              killall
              thunderbird
              keepassxc
              arandr
              starship
              gnumake
              gcc
              bat
              glibc
              picom
              jq
              jqp
            ];

            home.stateVersion = "23.05";
          };
        }
      ];
  };
}
