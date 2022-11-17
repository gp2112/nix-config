{ config, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops
    ../common/desktops/games
    ../common/desktops/desktop-env/plasma
    ./multimidia
  ];

  home.packages = with pkgs; [
  ];

}
