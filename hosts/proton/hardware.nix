{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  boot.initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "sd_mod" ];
  };


  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
  };

  hardware.cpu.intel.updateMicrocode = true;

  fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/nixos";
        fsType = "btrfs";
      };
      "/boot" = {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
      };

      "/data" = {
        device = "/dev/disk/by-label/data";
        fsType = "btrfs";
      };
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

}
