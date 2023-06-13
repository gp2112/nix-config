{ pkgs, ... }:

{
  imports = [ ./gpg ./ssh ./nvim ./fish ./git ];

  home.username = "gui";
  home.homeDirectory = "/home/gui";

  home.packages = with pkgs; [
    tree curl
    htop python3
    gcc nettools
    lfs man-pages
    manix nix-tree
  ];

  home.stateVersion = "22.11";

  programs = {
    home-manager.enable = true;
  };


}
