{ config, pkgs, ... }:

{ 

  home.packages = with pkgs; [ 
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
  ];

}
