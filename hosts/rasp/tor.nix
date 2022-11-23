{ config, pkgs, ... }:

{

  services.tor = {
    enable = true;
    openFirewall = true;
    relay = {
      enable = true;
      role = "bridge";
    };

    settings = {
      BridgeRelay = true;
      BandWidthRate = "3 MBytes";
      Nickname = "guipbridge";
      ORPort = 9112;
      ContactInfo = "me@guip.dev";
      ExitRelay = false;
    };

  };

}
