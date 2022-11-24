{ lib, pkgs, config, ... }:

{
  imports = [
    ../common
  ];

  environment.systemPackages = with pkgs; [ vim wget git ];

  networking = {
    hostName = "sputnik";
    useDHCP = true;
  };

  virtualisation.hypervGuest.enable = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  fileSystems = {
      "/" = {
        device = "/dev/vda1";
        fsType = "btrfs";
      };
  };

  console.keyMap = "br-abnt";

  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/vda";
    };
    initrd.availableKernelModules = [
      "ahci" "xhci_pci" "virtio_pci"
      "sr_mod" "virtio_blk"
    ];
  };

  swapDevices = [
    { device = "/dev/vda2"; }
  ];

  system.stateVersion = "22.05";
}
