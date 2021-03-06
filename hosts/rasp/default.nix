
  { config, pkgs, lib, ... }:

{
  imports = [
    "${fetchTarball "https://github.com/NixOS/nixos-hardware/archive/936e4649098d6a5e0762058cb7687be1b2d90550.tar.gz" }/raspberry-pi/4"
    
        ../common
        ./tor.nix
		./navidrome.nix
	    ./deluge.nix
	    ./nginx
	    ./headscale.nix
	];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
    "/data" = {
      device = "/dev/disk/by-uuid/7d26b07e-fa28-476e-9445-4a9b18a39452";
    };
  };
	
    
  networking = {
    hostName = hostname;

    nameservers = [ "1.1.1.1" "8.8.8.8" ];

    interfaces.eth0 = {
  	  useDHCP = false;
	  ipv4.addresses = [{ 
        address = "192.168.0.22";
        prefixLength = 24;
      }];
	  ipv6.addresses = [{
	    address = "2804:14d:8084:8880::5";
        prefixLength = 64;
      }];
    };
    
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 9112 36347 38803 4533 58846 6881 9954 ];
    };
  };

    environment.systemPackages = with pkgs; [ vim wget git ];


    
    services.openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
    };

    
    # Enable GPU acceleration
    hardware.raspberry-pi."4".fkms-3d.enable = true;

    system.stateVersion = "22.05";
  }
