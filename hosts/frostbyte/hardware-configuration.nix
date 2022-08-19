{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  boot.initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "sd_mod" ];
      kernelModules = [ "amdgpu" ];
  };


  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
    amdvlk
  ];

  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

  hardware.opengl.driSupport = true;
  # For 32 bit applications
  hardware.opengl.driSupport32Bit = true;
 

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
