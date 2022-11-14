{ config, pkgs, ... }:

{

  services.deluge = {
    enable = true;
    user = "deluge";
    declarative = true;
    config = {
	    download_location = "/data/torrents";
	    allow_remote = true;
	    daemon_port = 58846;
	    listen_ports = [ 6881 6889 ];
    };
    web.enable = true;
    openFirewall = true;
    web.openFirewall = true;
    authFile = "/var/deluge/auth";
  };

  networking.firewall.allowedTCPPorts = [ 58846 ];
  users.users.gui.extraGroups = [ "deluge" ];

}
