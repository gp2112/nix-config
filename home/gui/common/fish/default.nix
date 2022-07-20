{ config, pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];

  programs.fish = {
    enable = true;
    shellInit = "starship init fish | source";
  };
}
