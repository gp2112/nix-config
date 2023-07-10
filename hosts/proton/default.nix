{ pkgs, ... }:

let
  ip = "143.107.231.209";
  defaultGateway = "143.107.231.193";
  dns = "143.107.231.12";
  prefix = 26;
  interface = "eno1";
in
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

    nameservers = [ dns ];

    interfaces.${interface}.useDHCP = false;

    localCommands = ''
      ip address add ${ip}/${toString prefix} brd + dev ${interface}
      ip route add ${defaultGateway} dev ${interface}
      ip route add default via ${defaultGateway} dev ${interface}
    '';

  };

  system.stateVersion = "23.11";

}
