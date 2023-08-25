
{ config, lib, pkgs, ... }: {
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # darkReaders
      "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
      "annfbnbieaamhaimclajlajpijgkdblo" # chrome dark theme
    ];
  };
}

