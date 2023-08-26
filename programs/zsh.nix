{ config, lib, pkgs, ... }: {
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true; 
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" "z"];
  };
}
