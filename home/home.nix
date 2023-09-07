{ config
, lib
, pkgs
, astronvim
, asdf-kubectl
, asdf-kustomize
, base16-alacritty
, base16-fzf
, base16-shell
, oh-my-tmux
, oh-my-zsh
, ...
}:

let
  inherit (pkgs) stdenv;
in
{
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

        i7z
        cpupower-gui
        lshw
        powertop
        nushell
        xdg-desktop-portal-hyprland
        wofi
        dunst
        mpv
        waybar
	    fd
        swww
        gitoxide
	    hyprland
	    fzf
	    fzy
        gtk3
        cmatrix
        xorg.xf86inputsynaptics
        spotify
        cargo
        entr
        fdupes
        hyperfine
        rsync
        sd
        dog
        gping
        browsh
	    cava
	    firefox-wayland 
	    pavucontrol
	    pulseaudio
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
        arandr
        starship
        gnumake
        gcc
        bat
        glibc
        jq
        jqp

#networking
      mtr
      iperf3
      nmap
      ldns
      socat
      tcpdump

# archives
      zip
      xz
      unzip
      gnutar

# misc
      file
      which
      tree
      gnused
      gawk
      docker-compose

# python
      (python311.withPackages (ps:
                               with ps; [
                               ipython
                               pandas
                               requests
                               pyquery
                               pyyaml
                               ]))
      ];

  home.file = {
    ".zshrc" = {
       source = ../dotfiles/.zshrc;
     };
    ".bashrc" = {
       source = ../dotfiles/.bashrc;
     };
     ".tmux.conf" = {
       source = ../dotfiles/.tmux.conf;
     };
      ".config/hypr/" = {
        source = ../dotfiles/hypr;
        recursive = true;
      };
      ".config/alacritty/" = {
        source = ../dotfiles/alacritty;
        recursive = true;
      };
      ".config/starship.toml" = {
        source = ../dotfiles/starship.toml;
      };
      ".config/nvim/" = {
        source = ../dotfiles/nvim;
        recursive = true;
      };
      ".config/waybar/" = {
        source = ../dotfiles/waybar;
        recursive = true;
      };
      ".config/spotify/" = {
        source = ../dotfiles/spotify;
        recursive = true;
      };
      ".config/wallpaper/" = {
        source = ../dotfiles/wallpaper;
        recursive = true;
      };
      ".config/gh/" = {
        source = ../dotfiles/gh;
        recursive = true;
      };
      ".config/gtk-3.0/" = {
        source = ../dotfiles/gtk-3.0;
        recursive = true;
      };
      ".config/.scripts/" = {
        source = ../dotfiles/.scripts;
        recursive = true;
      };
   };

  xdg.dataFile = {

  };

  xdg.configFile = {

  };

  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # darkReaders
      "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
      "annfbnbieaamhaimclajlajpijgkdblo" # chrome dark theme
    ];
  };

  xdg.userDirs = lib.mkIf stdenv.isLinux {
    enable = true;
    createDirectories = true;
  };

  home.stateVersion = "22.11";
}
