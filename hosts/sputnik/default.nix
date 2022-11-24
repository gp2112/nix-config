{}:

{
  imports = [
    ../common
  ];

  environment.systemPackages = with pkgs; [ vim wget git ];

  fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/nixos";
        fsType = "ext4";
      };

      "/boot" = {
        device = "/dev/disk/by-label/boot";
      };
  };

  console.keyMap = "br-abnt";

  boot.loader.systemd-boot = {
    enable = true;
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "22.05";
}
