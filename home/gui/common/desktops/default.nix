{ pkgs, pkgs-master, ... }:


# Default packages for my desktop computers

{
  imports = [
    ./services
    ./aesthetic.nix
    ./minimum.nix
  ];


  home.packages = with pkgs; [
    element-desktop
    qbittorrent discord sonixd
    asciinema img-cat
    playerctl
    texlive.combined.scheme-tetex
    tor-browser-bundle-bin
    arduino gnome-decoder
    signal-desktop
  ];

}
