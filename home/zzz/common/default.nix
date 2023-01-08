{ pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    pavucontrol
    neofetch
    playerctl
  ];
}
