{ config, pkgs, ... }:

{ 

  home.packages = with pkgs; [ 
    htop
    pavucontrol
    thunderbird
    tdesktop
    qbittorrent
    vlc
    keepassxc
    discord
    firefox
    chromium
    sonixd
    evince
    spotify
    zettlr
    pulseaudio
    ffmpeg
    libreoffice
    xdragon
  ];

}
