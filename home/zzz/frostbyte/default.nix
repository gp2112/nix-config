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

}
