{ config, pkgs,... }:


let   
  BATTERY_DEVICE = "BAT0";
  MAXCHARGE = 68;
           
in {
  systemd.services.battery-charge-threshold = {

      unitConfig = {

        Description = "Set the battery charge threshold";
        After = "multi-user.target";
        StartLimitBurst = 0;
      };

      serviceConfig = {
        Type = "oneshot";
        Restart = "on-failure";
      };

      script = ''
        echo "Setting ${toString MAXCHARGE} to maxcharge..."
        echo ${toString MAXCHARGE} > "/sys/class/power_supply/${BATTERY_DEVICE}/charge_control_end_threshold" 
        echo "Success! Device ${BATTERY_DEVICE} set to ${toString MAXCHARGE}"'';

      
      wantedBy = [ "multi-user.target" ];

    };
}

