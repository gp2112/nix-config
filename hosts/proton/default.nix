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

    nameservers = [ "143.107.231.12" ];


    interfaces = {
      eno1 = {
        useDHCP = false;
      };
    };

    localCommands = ''
      ip address add 143.107.231.209/26 brd + dev eno1
      ip route add 143.107.231.193 dev eno1
      ip route add default via 143.107.231.193 dev eno1
    '';

  };

  system.stateVersion = "23.11";

}
