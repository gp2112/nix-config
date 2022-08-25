{ config, pkgs, ... }:

{

  services = {

    bind = {
      enable = true;
      cacheNetworks = [
        "192.168.0.0/24"
        "127.0.0.1"
      ];
      forwarders = [];
      extraOptions = ''
        recursion yes;
      '';
    };

  };

}
