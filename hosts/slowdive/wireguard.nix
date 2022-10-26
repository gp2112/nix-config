{ pkgs, ... }:

let
  serverIP = "186.223.220.181";
  port = 1194;
in
{
  networking.firewall = {
    allowedUDPPorts = [ port ]; # Clients and peers can use the same port, see listenport
    logReversePathDrops = true;
    extraCommands = ''
     ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport ${toString port} -j RETURN
     ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport ${toString port} -j RETURN
   '';
   extraStopCommands = ''
     ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport ${toString port} -j RETURN || true
     ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport ${toString port} -j RETURN || true
   '';
  };
  # Enable WireGuard
  networking.wireguard = {
    enable = true;
    interfaces = {
      # "wg0" is the network interface name. You can name the interface arbitrarily.
      wg0 = {
        # Determines the IP address and subnet of the client's end of the tunnel interface.
        ips = [ "10.100.0.2/24" ];
        listenPort = port; # to match firewall allowedUDPPorts (without this wg uses random port numbers)

        # Path to the private key file.
        #
        # Note: The private key can also be included inline via the privateKey option,
        # but this makes the private key world-readable; thus, using privateKeyFile is
        # recommended.
        privateKeyFile = "/home/gui/.wireguard-keys/private";

        peers = [
          # For a client configuration, one peer entry for the server will suffice.

          {
            # Public key of the server (not a file path).
            publicKey = "fyKDuiSYu9YvPRdROYMRV3j7yVtQdn6A2JdZloIu9hU=";

            # Forward all the traffic via VPN.
            # allowedIPs = [ "0.0.0.0/0" ];
            # Or forward only particular subnets
            allowedIPs = [ "10.100.0.1/24" ];

            # Set this to the server IP and port.
            endpoint = "${serverIP}:${toString port}"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

            # Send keepalives every 25 seconds. Important to keep NAT tables alive.
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
}
