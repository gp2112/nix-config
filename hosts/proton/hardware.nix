{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  boot.initrd = {
      availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  };

  boot.kernelModules = [ "kvm-intel" ];

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
        device = "/dev/disk/by-uuid/28a125e8-f02d-494f-b3f9-2a87bad66778";
        fsType = "btrfs";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/1143-8EAE";
        fsType = "vfat";
      };

  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/24f8c0cb-9008-43bb-bb03-44eb345356a2"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";


  users.users.gui.extraGroups = [ "jackaudio" ];


  # Enable pipewire sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [ libjack2 jack2 qjackctl jack_capture ];

}
