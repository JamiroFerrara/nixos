{ config, lib, pkgs, ... }: {
  users.users.jferrara = {
    isNormalUser = true;
    description = "jferrara";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
