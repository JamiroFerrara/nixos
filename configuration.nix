{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

    nix = {
      package = pkgs.nixFlakes;
      extraOptions = '' experimental-features = nix-command flakes '';
    };

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "it_IT.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Configure keymap in X11
  console.keyMap = "it";
  services.xserver = {
    enable = true;
    autorun = true; 
    layout = "it";
    desktopManager.xterm.enable = false; 
    windowManager.bspwm.enable = true; 
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "none+bspwm";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.jferrara = {
    isNormalUser = true;
    description = "jferrara";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  fonts.fonts = with pkgs; [
	  (nerdfonts.override { fonts = [ "JetBrainsMono"];})
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.system = "x86_64-linux";

  # List services that you want to enable:
  services.picom.enable = true;
  services.getty.autologinUser = "jferrara";

  system.stateVersion = "23.05"; # Did you read the comment?
}
