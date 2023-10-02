# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, cfg, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common
      ../common/wifi.nix
      ./services
      # ./wireguard.nix
    ];
  networking = {
    hostName = "slowdive"; # Define your hostname.
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };

  console.keyMap = "br-latin1-us";

  boot.loader = {
    efi.efiSysMountPoint = "/boot";
    grub = {
      enable = true;
      efiSupport = true;
      enableCryptodisk = true;
      device = "nodev";
    };
  };

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_5;
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  programs.sway.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  programs.xwayland.enable = true;
  security.polkit.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  security.pam.services.swaylock = {} ;

  networking.firewall.allowedTCPPortRanges = [
    {from = 1714; to = 1764;} # kde connect
  ];
  networking.firewall.allowedUDPPortRanges = [
    {from = 1714; to = 1764;} # kde connect
  ];
  networking.firewall.allowedTCPPorts = [ 8000 ];

  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # if uses wayland
  xdg.portal.wlr.enable = true;

  system.stateVersion = "22.11";

}

