
{ config, lib, pkgs, ... }: {
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true; 
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" "z"];
  };

}

