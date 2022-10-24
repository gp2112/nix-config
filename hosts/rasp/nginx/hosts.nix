{ config, pkgs, ... }:

{
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "me@guip.dev";

  services.nginx.virtualHosts = {

    "pgp.guip.dev" = {
      forceSSL = false;
      enableACME = false;

      locations."/" = {
        root = "/var/www/pgp.guip.dev/";
	    index = "43827E2886E5C34F38D577538C814D625FBD99D1.asc";
      };
    };

  };

}

