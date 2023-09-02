{nixpkgs, home-manager, ...}: {
  jferrara = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hardware-configuration.nix

        ./programs/chrome.nix
        ./programs/grub.nix
        ./programs/zsh.nix

        ./config/fonts.nix
        ./config/networking.nix
        ./config/nix.nix
        ./config/services.nix
        ./config/time.nix
        ./config/users.nix
        ./config/xorg.nix

        home-manager.nixosModules.home-manager {
          home-manager.users.jferrara = { pkgs, ... }: {
            home.username = "jferrara";
            home.homeDirectory = "/home/jferrara";
            programs.home-manager.enable = true;
            nixpkgs.config.allowUnfree = true;
            home.packages = with pkgs; [
              #Mac GPU drivers
	            mesa
	            intel-media-driver
	            amdvlk
	            libva
	            libva-utils
	            xwayland
	            vaapiVdpau

	            nodejs
	            (with dotnetCorePackages; combinePackages [
	             sdk_6_0
	             sdk_7_0
	            ])

              xdg-desktop-portal-hyprland
              wofi
              dolphin
              dunst
              mpv
              waybar
	            fd
              swww
              gitoxide
              foot
	            hyprland
	            fzf
	            fzy
              gtk3
              kitty
              spotify
              cargo
              chromium
	            google-chrome
	            firefox
	            htop
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
