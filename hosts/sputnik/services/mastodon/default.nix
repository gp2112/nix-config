{ pkgs, ... }:

let
  port = 55001;
  domain = "komuna.digital";
  dbName = "mastodon";
in
{
  imports = [
    ../postgresql.nix
    ../nginx.nix
  ];


  services.mastodon = {
    enable = true;
    webPort = port;
    localDomain = domain;
    database = {
      name = dbName;
      user = dbName;
    };
    smtp = rec {
      user = "mastodon@komuna.digital";
      fromAddress = user;
      authenticate = true;
      createLocally = false;
      host = "mail.gandi.net";
      port = 465;
    };
    configureNginx = true;
    enableUnixSocket = false;

    extraConfig = {
      "DEFAULT_LOCALE" = "pt-BR";
      "RAILS_ENV" = "production";
      "SMTP_SSL" = "true";
      "SMTP_DELIVERY_METHOD" = "smtp";
      "SMTP_AUTH_METHOD" = "plain";
      "SMTP_DOMAIN" = "localhost";
      "SMTP_OPENSSL_VERIFY_MODE" = "none";
      "SMTP_ENABLE_STARTTLS_AUTO" = "true";
    };

  };

  services.nginx.virtualHosts = {
    "${domain}" = {
      forceSSL = true;
      enableACME = true;
    };
  };

  services.postgresql = {
    ensureUsers = [{
      name = dbName;
      ensurePermissions = {
        "DATABASE \"${dbName}\"" = "ALL PRIVILEGES";
      };
    }];

    ensureDatabases = [ dbName ];
  };
}
