{ config, ... }:

{

  imports = [  ];

  programs.waybar = {
    enable = true;
    settings = {

      topBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 7;
        modules-left = [ "sway/mode" "wlr/taskbar" ];
        modules-center = [ "clock" ];

        clock = {
          format = "{:%H:%M %A %d/%m/%Y}";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "   0%";
          format-icons = {
            headphone = "";
            headset = " ";
            portable = " ";
            default = [ " " " " " " ];
          };
        };

        battery = {
          bat = "BAT0";
          interval = 5;
          format-icons = [ "" "" "" "" "" "" "" "" "" "" ];
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
        };

        network = {
          interval = 5;
          format-wifi = "   {essid}";
          format-ethernet = "";
          format-disconnected = "";
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [ "" " " " " " " ];
        };

        memory = {
          format = " {percentage}%";
        };

        disk = {
          format = " {used}/{total}";
        };

        bluetooth = {
          format = " {status}";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          on-click = "bluetoothctl power on";
          on-click-right = "bluetoothctl power off";
        };

      };

      bottomBar = {
        layer = "bottom";
        position = "bottom";
        height = 40;
        width = 400;
        modules-left = [ "sway/window" ];
        modules-center = [ "wlr/workspaces" ];

        "sway/workspaces" = {
          format = "  {index}  ";
        };

      };
    };
  };
}
