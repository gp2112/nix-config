{ config, pkgs, ... }:

{ imports = [ ./gpg ./ssh ./neovim.nix ./fish ./git ./hyprland ./kitty ./waybar ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "gui";
  home.homeDirectory = "/home/gui";
 
  home.packages = with pkgs; [ 
    thunderbird
    tree 
    qbittorrent
    vlc
    htop
    fira-code
    fira
    python3
    cava
    gcc
    go
    nodejs
    rustc
  ];

  home.stateVersion = "22.05";

  programs = {
    home-manager.enable = true;
  };


}
