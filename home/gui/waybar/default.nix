{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [ "eDP-1" ];
        modules-left = [ "wlr/workspaces" "wlr/mode" "wlr/taskbar" ];
        modules-center = [ "clock" ];
        modules-right = [ "backlight" "wifi" "bluetooth" "temperature" "battery" ];
        
        clock = {
          format = "{:%H:%M %A %d/%m/%Y}";
        };

      };
    };
  };
}
