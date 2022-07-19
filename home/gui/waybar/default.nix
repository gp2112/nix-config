{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        layer = "top";
        position = "top";
        height = 30;
        output = [ "eDP-1" ];
        modules-left = [ "wlr/workspaces" "wlr/mode" "wlr/taskbar" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "backlight" "bluetooth" "temperature" "battery" ];
        
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
          format-disconnected = "睊 ";
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [ "" " " " " " " ];
        };

        "wlr/workspaces" = {
          format = "{icon}";

        };

      };
    };
  };
}
