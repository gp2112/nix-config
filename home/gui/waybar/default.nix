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
         modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
         modules-center = [ "sway/window" ];
         modules-right = [ "temperature" "battery" ];
      };
    };
  };
}
