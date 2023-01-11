{ pkgs, ... }:

{
  imports = [
    ./fish
    ./wayland
  ];

  home = {
    username = "zzz";
    stateVersion = "22.11";
    homeDirectory = "/home/zzz";
  };

  home.packages = with pkgs; [
    htop
    pavucontrol
    neofetch
    playerctl
    curl
    nettools
  ];

  programs = {
    home-manager.enable = true;
  };

}