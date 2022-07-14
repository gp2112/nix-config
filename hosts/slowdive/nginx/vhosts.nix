{ config, pkgs, ... }:

{
  services.nginx.virtualHosts = {
    "pgp.guip.dev" = {
      root = "/var/www/data/";
    };

  };

}
