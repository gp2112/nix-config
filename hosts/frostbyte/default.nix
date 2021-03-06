{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common
    ];

  networking = {
    hostName = "frostbyte"; # Define your hostname.
  };

  # Enable sound.
  sound.enable = true;
  services.pipewire.enable = true;


  programs.xwayland.enable = true;


  # programs.sway.enable = true;

  # services.xserver.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gui = {
    isNormalUser = true;
    group = "gui";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$0pkRqHNzwEluhMz/$WVb0iiLiYz6avBxS0RgwrpTVsHTfsPEVPM17JjUvTQDFf3o3Q3FUrsGfLhLOMEEItR.Ph2ky56rPZVjpgBxWX0";
    shell = pkgs.fish;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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

