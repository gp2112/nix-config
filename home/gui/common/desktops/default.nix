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
    element-desktop
    qbittorrent
    vlc
    keepassxc
    discord
    firefox
    chromium
    sonixd
    evince
    spotify
    pulseaudio
    ffmpeg
    libreoffice
    xdragon
    asciinema
    neofetch
    img-cat
    playerctl
    marktext
    gummi
    tor-browser-bundle-bin
    arduino
    sublime-music
    gparted

    (pkgs.writeShellScriptBin "rasptunnel" ''
      ssh -D 8888 gui@home.guip.dev -p 2020
    '')

  ];

}
