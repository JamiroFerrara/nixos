{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.system = "x86_64-linux";
  services.picom.enable = true;
  services.getty.autologinUser = "jferrara";
  system.stateVersion = "23.05"; # Did you read the comment?
}
