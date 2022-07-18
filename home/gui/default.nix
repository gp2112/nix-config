{ config, pkgs, ... }:

{ imports = [ ./gpg ./ssh ./neovim.nix ./fish ./git ./hyprland ./kitty ./waybar ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "gui";
  home.homeDirectory = "/home/gui";
 
  home.packages = with pkgs; [ 
    thunderbird
    tdesktop
    tree 
    qbittorrent
    vlc
    htop
    python3
    cava
    gcc
    go
    nodejs
    rustc
    keepassxc
    discord

  ];
  
  
  home.stateVersion = "22.05";

  programs = {
    home-manager.enable = true;
  };


}
