{ config, pkgs, lib, ... }:

{

  services.nextcloud = {
    enable = true;
    home = "/data/nextcloud";
    hostName = "cloud.guip.dev"

    maxUploadSize = "10G";

    https = true;

    config = {
      adminuser = "gui"; 
      dbtype = "sqlite";

    }

  };

}
