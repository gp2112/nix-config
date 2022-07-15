{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

}
