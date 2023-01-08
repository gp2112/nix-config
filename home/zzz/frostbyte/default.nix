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
  ];

  programs.fish.shellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ];
      exec startplasma-wayland
    end
  '';
}
