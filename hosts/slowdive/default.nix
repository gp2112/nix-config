# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common
    ];
  networking = {
    hostName = "slowdive"; # Define your hostname.
    networkmanager.enable = true;
  };

  users.users.gui.extraGroups = [ "networkmanager" ];

  console.keyMap = "br-latin1-us";

  boot.loader = {
    efi.efiSysMountPoint = "/boot";
    grub = {
      enable = true;
      version = 2;
      efiSupport = true;
      enableCryptodisk = true;
      device = "nodev";    
    };
  };

  # Enable sound.
  sound.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.xwayland.enable = true;


  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
  ];

  
  
  networking.firewall.allowedTCPPortRanges = [ 
    {from = 1714; to = 1764;} # kde connect
  ];
  networking.firewall.allowedUDPPortRanges = [ 
    {from = 1714; to = 1764;} # kde connect
  ];

  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "21.11";

}

