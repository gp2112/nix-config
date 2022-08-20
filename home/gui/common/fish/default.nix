{ config, pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];

  home.sessionVariables = {
    fish_greeting = "";
  };

  programs.fish = {
    enable = true;
    shellInit = "starship init fish | source";
  };
}
