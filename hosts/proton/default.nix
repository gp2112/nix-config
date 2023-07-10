{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../common
    ../common/plasma.nix
    ../common/docker.nix
  ];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_4;

  console.keyMap = "br-abnt";

  networking = {
    hostName = "proton";

    nameservers = [ "8.8.8.8" "8.8.4.4" ];

    interfaces = {
      eno1 = {
        ipv4 = {
          addresses = [{
            address = "143.104.231.209";
            prefixLength = 26;
          }];
          routes = [
            { address = "0.0.0.0"; prefixLength = 0; via = "143.107.231.193"; }
          ];
        };
      };
    };

  };

  system.stateVersion = "23.11";

}
