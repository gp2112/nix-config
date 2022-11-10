
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
        ./wireguard.nix
        # ./nextcloud
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
    hostName = "rasp";

    nameservers = [ "8.8.8.8" "1.1.1.1" ];
    defaultGateway = {
      address = "192.168.1.1";
      interface = "eth0";
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 9112 36347 38803 4533 58846 6881 9954 ];
      allowedUDPPorts = [  ];
    };
  };

    environment.systemPackages = with pkgs; [ vim wget git nmap wakelan ];

    # Enable GPU acceleration
    hardware.raspberry-pi."4".fkms-3d.enable = true;
    hardware.raspberry-pi."4".i2c1.enable = true;
   #  nixpkgs-stable.hostPlatform.system = "aarch64-linux";
    powerManagement.cpuFreqGovernor = "ondemand";

    system.stateVersion = "22.05";
  }
