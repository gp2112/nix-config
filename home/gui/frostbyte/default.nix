{ config, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops
    ../common/desktops/games
    ./multimidia
  ];

  home.packages = with pkgs; [
  ];

}
