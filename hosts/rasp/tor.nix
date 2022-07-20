{ config, pkgs, ... }:

{

  services.tor = {
    enable = true;
    relay = {
      enable = true;
      role = "bridge";
    };

    settings = {
      BandWidthRate = "2 MBits";
      Nickname = "guipbridge";
      ORPort = 9112;

    };

  };

}
