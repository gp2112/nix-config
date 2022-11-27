{ pkgs, ... }:

{
  imports = [ ./gpg ./ssh ./nvim ./fish ./git ];

  home.username = "gui";
  home.homeDirectory = "/home/gui";

  home.packages = with pkgs; [
    tree
    curl
    htop
    python3
    gcc
    nettools
    lfs
  ];

  home.stateVersion = "22.05";

  programs = {
    home-manager.enable = true;
  };


}
