{ pkgs, ... }:

{

  imports = [
    ./wayland
  ];

  home.packages = with pkgs; [
    libreoffice
    firefox
    chromium
    thunderbird
    tdesktop
    keepassxc
    spotify
    vlc
    qbittorrent
    krita
  ];

  programs.fish.shellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ];
      exec startplasma-wayland
    end
  '';

}
