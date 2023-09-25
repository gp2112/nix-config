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
        max_upload_slots_global = 30;
        max_active_seeding = 30;
        max_active_limit = 40;
    };
    web.enable = true;
    openFirewall = true;
    web.openFirewall = true;
    authFile = "/var/deluge/auth";
  };

  networking.firewall.allowedTCPPorts = [ 58846 ];
  users.users.gui.extraGroups = [ "deluge" ];

}
