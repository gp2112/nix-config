{ config, pkgs, ... }:

{ 
  imports = [
    ./minecraft.nix  
  ];

  home.packages = with pkgs; [ 
    steam
    wine-staging
    lutris
    gamemode
  ];


}

