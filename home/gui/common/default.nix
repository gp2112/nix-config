{ config, pkgs, ... }:

{ 
  imports = [ ./gpg ./ssh ./neovim.nix ./fish ./git ];

  home.username = "gui";
  home.homeDirectory = "/home/gui";

  home.packages = with pkgs; [ 
    tree 
    htop
    python3
    gcc
    go
    nodejs
    rustc
  ];

  home.stateVersion = "22.05";

  programs = {
    home-manager.enable = true;
  };


}
