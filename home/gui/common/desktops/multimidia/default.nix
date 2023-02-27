{ config, pkgs, ... }:

{
  imports = [
    ./obs-studio.nix
  ];

  home.packages = with pkgs; [ 
    krita
    kdenlive
    guitarix
    audacity
  ];

  

}
