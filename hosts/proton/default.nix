{}:

{
  imports = [
    ./hardware.nix
    ../common
    ../common/plasma.nix
    ../common/docker.nix
  ];

  networking = {
    hostname = "proton";

    nameservers = [ "143.104.231.12" ];

    interfaces = [{
      eno1 = {
        ipv4 = {
          addresses = [{
            address = "143.104.231.209";
            prefixLength = 26;
          }];
        };
      };
    }];

  };

}
