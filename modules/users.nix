{ config, lib, pkgs, ... }: {
  users.users.jferrara = {
    isNormalUser = true;
    description = "jferrara";
    extraGroups = [ "networkmanager" "wheel" "audio"];
    packages = with pkgs; [];
  };
  security.sudo.wheelNeedsPassword = false;
}
