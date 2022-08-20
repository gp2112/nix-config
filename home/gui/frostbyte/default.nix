{ config, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops
    ../common/desktops/games
    ./swayconf.nix
    ./multimidia
  ];

  home.packages = with pkgs; [
  ];

}
