{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common
      ./audio.nix
      ./plasma.nix
      ./services
    ];


  networking = {
    hostName = "frostbyte"; # Define your hostname.
    nameservers = [ "8.8.8.8" "8.8.4.4" ];

    interfaces.enp4s0 = {
      wakeOnLan.enable = true;
      useDHCP = true;
    };
  };

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  console.keyMap = "br-abnt";

  programs.xwayland.enable = true;
  security.polkit.enable = true;

  virtualisation.virtualbox.host.enable = true;

  services = {
    dbus.enable = true;
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  security.pam.services.swaylock = {};
  networking.firewall.allowedTCPPortRanges = [
    {from = 1714; to = 1764;} # kde connect
  ];
  networking.firewall.allowedUDPPortRanges = [
    {from = 1714; to = 1764;} # kde connect
  ];
  networking.firewall.allowedTCPPorts = [ 8000 ];

  # if uses wayland
  xdg.portal.wlr.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

