{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    openjdk16-bootstrap
    prismlauncher
  ];

}
