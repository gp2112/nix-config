{ config, pkgs, ... }:

{ 
  imports = [ ./gpg ./ssh ./neovim.nix ./fish ./git ];

  home.packages = with pkgs; [ 
    thunderbird
    tdesktop
    qbittorrent
    vlc
    keepassxc
    discord
    firefox

  ];

}
