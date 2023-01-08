{ pkgs, ... }:

{
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
