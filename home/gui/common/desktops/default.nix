{ pkgs, pkgs-master, ... }:


# Default packages for my desktop computers

{
  imports = [
    ./services
    ./aesthetic.nix
  ];


  home.packages = with pkgs; [
    htop
    pavucontrol
    thunderbird
    tdesktop
    element-desktop
    pkgs-master.qbittorrent
    vlc
    keepassxc
    discord
    firefox
    ungoogled-chromium
    sonixd
    evince
    pulseaudio
    ffmpeg
    libreoffice
    xdragon
    asciinema
    neofetch
    img-cat
    playerctl
    ghostwriter
    texlive.combined.scheme-tetex
    gummi
    tor-browser-bundle-bin
    arduino
    gparted
    spotify
    gnome-decoder
    signal-desktop

    (pkgs.writeShellScriptBin "rasptunnel" ''
      ssh -D 8888 gui@home.guip.dev -p 2020
    '')

  ];

}
