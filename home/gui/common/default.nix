{ config, pkgs, ... }:

{ 
  imports = [ ./gpg ./ssh ./neovim.nix ./fish ./git ];

  home.username = "gui";
  home.homeDirectory = "/home/gui";

  home.packages = with pkgs; [ 
    tree 
    curl
    htop
    python3
    gcc
    go
    nodejs
    rustc
    nettools
  ];

  home.stateVersion = "22.05";

  programs = {
    home-manager.enable = true;
  };


}
