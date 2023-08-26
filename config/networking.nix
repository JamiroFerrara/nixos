{ config, lib, pkgs, ... }: {
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}

