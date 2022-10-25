{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host rasp
        HostName home.guip.dev
        Port 2020
        User gui
      Host galapagos
        HostName galapagos.gelos.club
        Port 2112
        User admin
    '';
  };

}
