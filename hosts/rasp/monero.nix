{ pkgs, ... }:

let
  port = 18081;
  
in
{
  services.monero = {
    enable = true;
    dataDir = "/data/monero";
    rpc = {
      address = "127.0.0.1";
      inherit port;
    };
  };

  # networking.firewall.allowedTCPPorts = [ port ];

}
