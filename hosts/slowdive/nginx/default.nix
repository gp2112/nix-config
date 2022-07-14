{ config, pkgs, ... }:

{ imports = [ ./vhosts.nix ];

  services.nginx.enable = true;
}
