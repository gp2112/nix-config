{ pkgs, ... }:

{

  # allow direct music download from deluge
  users.users.deluge.extraGroups = [ "navidrome" ];

  services = {
    navidrome = {
      enable = true;
      settings = {
        Address = "0.0.0.0";
        Port = 4533;
        MusicFolder = "/data/Music";
        CoverArtPriority = "cover.*, embedded, front.*, folder.*";
        EnableStarRating = false;
      };
    };
    nginx.virtualHosts."music.guip.dev" = {
      forceSSL = false;
      enableACME = false;

      locations."/" = {
        proxyPass = "http://localhost:4533";
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 4533 ];

}
