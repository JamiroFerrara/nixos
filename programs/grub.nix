{ config, lib, pkgs, ... }: {
  # Bootloader.
  boot.loader = {
	  grub = {
		  device = "nodev";
		  gfxmodeEfi = "1024x768";
		  efiSupport = true;
		  efiInstallAsRemovable = true;
	  };
	  efi.efiSysMountPoint = "/boot/efi";
	  efi.canTouchEfiVariables = false;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;}
