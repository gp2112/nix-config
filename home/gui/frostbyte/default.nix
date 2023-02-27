{ config, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops
    ../common/desktops/games
    ../common/desktops/desktop-env/plasma
    ../common/desktops/multimidia
  ];

  home.packages = with pkgs; [
    monero-gui
    qt6.qtwebsockets
    libsForQt5.kcalc
  ];

  programs.fish.shellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ];
      exec startplasma-wayland
    end
  '';

}
