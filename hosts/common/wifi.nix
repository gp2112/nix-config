{ pkgs, ... }:

{
  networking.wireless = {
    enable = true;
    userControlled.enable = true;

    environmentFile = "/etc/wifi/passwds";
    networks = {

      ACAB5Ghz = {
        pskRaw = "@PSK_ACAB5GHZ@";
        priority = 4;
      };

      "SOLIS 5G" = {
        pskRaw = "@PSK_SOLIS@";
        priority = 2;
      };

      "SOLIS 2G" = {
        pskRaw = "@PSK_SOLIS@";
        priority = 1;
      };

      LoL = {
        pskRaw = "@PSK_LoL@";
        priority = 5;
      };

      eduroam = {
        auth = ''
          key_mgmt=WPA-EAP
          identity="@EDUROAM_ID@"
          password="@EDUROAM_PASSWORD@"
          phase2="auth=MSCHAPV2"
          domain_suffix_match="semfio.usp.br"
          eap=PEAP
          auth_alg=OPEN
          pairwise=CCMP
        '';
        priority=1;
      };

    };

  };
}
