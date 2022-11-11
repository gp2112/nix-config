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

    nginx.virtualHosts."localhost" = {
      locations."/" = {
        proxyPass = "https://cloud.guip.dev/";
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
        '';
      };
    };

  };

  users.users.nginx.extraGroups = [ "nextcloud" ];

}
