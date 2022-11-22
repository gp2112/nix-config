{ pkgs, ... }:

let
  port = 10646;
in
{
  services.i2p.enable = true;

  networking.firewall = {
    allowedTCPPorts = [ port ];
    allowedUDPPorts = [ port ];
  };
}
