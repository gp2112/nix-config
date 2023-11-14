{ config, pkgs, ... }:

{
  imports = [
    ./users.nix
    ./nix.nix
    ./sshd.nix
  ];


  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
  };

  environment.systemPackages = with pkgs; [
    vim htop
    wget curl
    git
    zip unzip
  ];

  time.timeZone = "America/Sao_Paulo";

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
  ];

  services.usbmuxd.enable = true;

  environment.enableAllTerminfo = true;

  programs.ssh.extraConfig = ''
      Host rasp
        HostName home.guip.dev
        Port 2020
        User gui
      Host galapagos
        HostName galapagos.gelos.club
        Port 2112
        User admin
  '';

  networking.hosts = {
    "192.168.1.2" = [ "rasp" ];
  };

}
