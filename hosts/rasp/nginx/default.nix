{ config, pkgs, ... }:

{
  imports = [ ./hosts.nix ];

  services.nginx = {
    enable = true;
    resolver.addresses = [ "[::1]" "8.8.8.8" ];
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };

  networking.firewall.allowedTCPPorts = [ 443 80 ];

}
