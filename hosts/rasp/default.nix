
{ pkgs, inputs, ... }:

{
  imports = [
        inputs.nixos-hardware.nixosModules.raspberry-pi-4
        ../common
        ../common/wifi.nix
        ./tor.nix
		./navidrome.nix
	    ./deluge.nix
	    ./nginx
        ./git
        # ./wireguard.nix
        ./nextcloud
        ./nfs.nix
        ./monero.nix
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

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  networking = {
    hostName = "rasp";
    useDHCP = false;

    nameservers = [ "8.8.8.8" "1.1.1.1" ];
    defaultGateway = {
      address = "192.168.1.1";
      interface = "wlan0";
    };

    interfaces.wlan0 = {
      ipv4.addresses = [{
        address = "192.168.1.2";
        prefixLength = 24;
      }];
      ipv6.addresses = [{
        address = "2804:2894:f0ee:ee00::4:1";
        prefixLength = 64;
      }];
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [  ];
    };

  };

    environment.systemPackages = with pkgs; [ nmap wakelan ];

    # Enable GPU acceleration
    hardware.raspberry-pi."4".fkms-3d.enable = true;
    hardware.raspberry-pi."4".i2c1.enable = true;
   #  nixpkgs-stable.hostPlatform.system = "aarch64-linux";
    powerManagement.cpuFreqGovernor = "ondemand";

    system.stateVersion = "22.05";
  }
