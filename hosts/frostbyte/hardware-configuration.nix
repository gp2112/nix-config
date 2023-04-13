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

  programs.gamemode = {
    enable = true;
    settings = {
      general.renice = 10;
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };
    };
  };

  users.users.gui.extraGroups = [ "gamemode" ];

}
