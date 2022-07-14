{ config, pkgs, ... }:

{ imports = [ ./neovim.nix ./fish ./git ./hyprland ./kitty ./waybar ];

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
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  programs = {
    home-manager.enable = true;
  };


}
