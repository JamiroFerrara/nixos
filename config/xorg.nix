{ config, lib, pkgs, ... }: {
  # Configure keymap in X11
  console.keyMap = "it";
  programs.hyprland.enable = true;
  services.xserver = {
    enable = true;
    autorun = true; 
    layout = "it";
    desktopManager.xterm.enable = false; 
    windowManager.bspwm.enable = true; 
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "hyprland";
  };

}
