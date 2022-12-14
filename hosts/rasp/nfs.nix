{ pkgs, ... }:

let
  sPort = 4000;
  lPort = 4001;
  mPort = 4002;
in
{
  services.nfs.server = {
    enable = true;
    statdPort = sPort;
    lockdPort = lPort;
    mountdPort = mPort;
    exports = ''
      /data    192.168.1.3(rw,sync,no_subtree_check)
    '';
  };

  networking.firewall = {
    allowedTCPPorts = [ sPort lPort mPort ];
    allowedUDPPorts = [ sPort lPort mPort ];
  };

}
