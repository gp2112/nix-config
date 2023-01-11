{ pkgs, ... }:

{

  imports = [
    ../common
    ../common/desktop.nix
  ];

  home.packages = with pkgs; [
    steam
    lutris
    minecraft
    virtualbox
  ];

}
