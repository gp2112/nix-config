{ pkgs, ... }:

{
  imports = [ ./gpg ./ssh ./nvim ./fish ./git ];

  home.username = "gui";
  home.homeDirectory = "/home/gui";

  home.packages = with pkgs; [
    tree curl
    htop python311
    python311Packages.pip
    gcc nettools
    lfs man-pages
    manix nix-tree
    nvd
  ];

  home.stateVersion = "22.11";

  programs = {
    home-manager.enable = true;
  };


}
