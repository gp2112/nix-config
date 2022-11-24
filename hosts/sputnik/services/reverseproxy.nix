{ ... }:

{
  imports = [
    ./nginx.nix
  ];

  services.nginx.virtualHosts = {
    "music.guip.dev" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://[2804:2894:f0d1:9400::4:1]:4533";
      };
    };
  };

}
