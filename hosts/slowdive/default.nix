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


  users.users.gui = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$0pkRqHNzwEluhMz/$WVb0iiLiYz6avBxS0RgwrpTVsHTfsPEVPM17JjUvTQDFf3o3Q3FUrsGfLhLOMEEItR.Ph2ky56rPZVjpgBxWX0";
    shell = pkgs.fish;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    wget
    firefox
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

