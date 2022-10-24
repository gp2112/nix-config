{ pkgs, ... }:

{
  networking.firewall.trustedInterfaces = [ "tun0" ];
  services.openvpn.servers = {
    home = { config = " config /etc/openvpn/home-client.ovpn "; };
  };
}
