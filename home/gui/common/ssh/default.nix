{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host rasp
        HostName home.guip.dev
        Port 2020
        User gui
    '';
  };

}
