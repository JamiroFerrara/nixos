{ config, lib, pkgs, ... }: {
  # Configure keymap in X11
  console.keyMap = "it";
  programs.hyprland.enable = true;

  boot.kernelParams = [
     "intel_pstate=active"
     "acpi_mask_gpe=0x15"
  ];
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  services.xserver = {
    enable = true;
    autorun = true; 
    layout = "it";
    desktopManager.xterm.enable = false; 
    windowManager.bspwm.enable = true; 
    displayManager.sddm.enable = true;
    displayManager.defaultSession = "hyprland";
  };

}
