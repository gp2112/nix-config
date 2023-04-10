{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  boot.initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "sd_mod" "nvme" ];
      kernelModules = [ "amdgpu" ];
  };


  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  hardware.cpu.intel.updateMicrocode = true;

  hardware.opengl = {
    enable = true;
    mesaPackage = pkgs.mesa_23;
    mesaPackage32 = pkgs.pkgsi686Linux.mesa_23;
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];

    driSupport = true;
    driSupport32Bit = true;
  };
 

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
