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

    postgresql = {
      ensureUsers = [{
        name = "nextcloud";
        ensurePermissions = {
          "DATABASE nextcloud" = "ALL PRIVILEGES";
        };
      }];
      ensureDatabases = [ "nextcloud" ];
    };

    nginx.virtualHosts."cloud.guip.dev" = {
      forceSSL = true;
      enableACME = true;

    };

  };

  users.users.nginx.extraGroups = [ "nextcloud" ];

}
