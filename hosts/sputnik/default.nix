{ lib, pkgs, ... }:

{
  imports = [
    ../common
  ];

  environment.systemPackages = with pkgs; [ vim wget git ];

  networking = {
    hostName = "sputnik";
  };

  fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/root";
        fsType = "btrfs";
      };
  };

  console.keyMap = "br-abnt";

  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  system.stateVersion = "22.05";
}
