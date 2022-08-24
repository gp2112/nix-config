{ config, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops
    ../common/desktops/games
    ./swayconf.nix
    #../common/desktops/desktop-env/hyprland
    ./multimidia
  ];

  home.packages = with pkgs; [
  ];

}
