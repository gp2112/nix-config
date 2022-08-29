{ pkgs, ... }:


# Default packages for my desktop computers

{
  imports = [
    ./services
    ./aesthetic.nix
    ./terminal-emulator/kitty
  ];

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
    asciinema
    neofetch
    img-cat
    playerctl
    obsidian
    gummi
  ];

}
