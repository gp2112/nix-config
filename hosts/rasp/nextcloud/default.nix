{ pkgs, ... }:

{

  services = {
    nextcloud = {
      enable = true;
      home = "/data/nextcloud";
      hostName = "cloud.guip.dev";

      maxUploadSize = "10G";

      https = true;

      config = {
        adminuser = "gui";
        adminpassFile = "/data/nextcloud/passwd";
        dbtype = "sqlite";
      };
    };
    nginx.virtualHosts."cloud.guip.dev" = {
      forceSSL = true;
      enableACME = true;

      locations."/" = {
        root = "/data/nextcloud/data/";
      };
    };


  };

  users.users.nginx.extraGroups = [ "nextcloud" ];

}
