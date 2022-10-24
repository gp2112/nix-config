{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host rasp
        HostName 192.168.0.22
        Port 22
        User gui
    '';
  };

}
