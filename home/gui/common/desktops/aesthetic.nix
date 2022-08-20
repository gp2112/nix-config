{ config, pkgs, ... }:

{ 
  home.packages = with pkgs; [
    cbonsai
    asciiquarium
    neo-cowsay
    ascii-image-converter
    cava
  ];
}
