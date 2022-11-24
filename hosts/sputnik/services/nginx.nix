{ config, pkgs, ... }:

{

  services.nginx = {
    enable = true;
    resolver.addresses = [ "[::1]" "8.8.8.8" ];
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "contato@kamarada.digital";
  };

  networking.firewall.allowedTCPPorts = [ 443 80 ];

}
