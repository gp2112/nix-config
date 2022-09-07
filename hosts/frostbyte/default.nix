{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common
    ];

  networking = {
    hostName = "frostbyte"; # Define your hostname.
    nameservers = [ "8.8.8.8" "8.8.4.4" ];

  };

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_19;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  programs.xwayland.enable = true;
  security.polkit.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  services.dbus.enable = true;
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
  system.stateVersion = "21.11"; # Did you read the comment?

}

