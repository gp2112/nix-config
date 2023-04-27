{ pkgs, ... }:
{
  services.tor = {
    enable = true;

    client = {
      enable = true;
      dns.enable = true;
    };
  };
}
