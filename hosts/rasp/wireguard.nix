{ pkgs, ... }:


let
  interface = "eth0";
  port = 1194;
in
{

  networking.nat = {
    enable = true;
    externalInterface = interface;
    internalInterfaces = [ "wg0" ];
  };

  networking.firewall = {
    allowedUDPPorts = [ port ];
  };

  networking.wireguard = {
    enable = true;
    interfaces = {

      wg0 = {
        ips = [ "10.100.0.1/24" ];
        listenPort = port;
        postSetup = ''
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
        '';
        postShutdown = ''
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
        '';
        privateKeyFile = "/root/wireguardpriv.key";

        peers = [
          # slowdive
          {
            publicKey = "NnmCfmXW7TnBPRL/KGlflS5t/KCrh5zPwsOisT6xxmA=";
            allowedIPs = [ "10.100.0.2/32" ];
          }
        ];


      };

    };
  };
}
