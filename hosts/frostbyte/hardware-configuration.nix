{ config, lib, pkgs, modulesPath, ... }:

{
  

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

 

  fileSystems = {
      "/" = { 
        device = "/dev/disk/by-label/nixos";
        fsType = "btrfs";
      };
      "/home" = { 
        device = "/dev/disk/by-label/home";
        fsType = "btrfs";
      };
      "/boot" = { 
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
      };
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

}
