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
        device = "/dev/vda1";
        fsType = "btrfs";
      };
  };

  console.keyMap = "br-abnt";

  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };

  swapDevices = [
    { device = "/dev/vda2"; }
  ];

  system.stateVersion = "22.05";
}
