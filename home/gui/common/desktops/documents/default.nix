{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice texlive.combined.scheme-tetex
    gummi ghostwriter evince
  ];
}
