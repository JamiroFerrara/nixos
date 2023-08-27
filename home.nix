{ config
, lib
, pkgs
, astronvim
, asdf-kubectl
, asdf-kustomize
, base16-alacritty
, base16-fzf
, base16-shell
, oh-my-tmux
, oh-my-zsh
, ...
}:

let
  inherit (pkgs) stdenv;
in
{
  home.file = {
    ".zshrc" = {
      source = ./.zshrc;
    };
  };

  xdg.dataFile = {

  };

  xdg.configFile = {

  };

  xdg.userDirs = lib.mkIf stdenv.isLinux {
    enable = true;
    createDirectories = true;
  };

  home.stateVersion = "22.11";
}
