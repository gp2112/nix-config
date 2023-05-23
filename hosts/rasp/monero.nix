{ pkgs, ... }:

let
  ports = {
    rpc = 18081;
    p2p = 18080;
  };
in
{

  environment.systemPackages = with pkgs; [ monero-cli ];

  services.monero = {
    enable = true;
    dataDir = "/data/monero";
    rpc = {
      address = "0.0.0.0";
      port = ports.rpc;
    };
    extraConfig = ''
      confirm-external-bind=1
    '';
  };

  networking.firewall.allowedTCPPorts = [ ports.rpc ports.p2p ];

}
