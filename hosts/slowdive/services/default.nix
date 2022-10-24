{ config, pkgs,... }:

/*

All enabled services should be put in this list

*/

{
  imports = [
    ./battery-threshold.nix
  ];

}

