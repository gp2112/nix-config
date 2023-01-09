{ pkgs, ... }:

{

  imports = [
    ../common
  ];

  home.packages = with pkgs; [
    steam
    lutris
    libreoffice
    firefox
    chromium
    thunderbird
    tdesktop
    keepassxc
    minecraft
    spotify
  ];

  programs.fish.shellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ];
      exec startplasma-wayland
    end
  '';
}
