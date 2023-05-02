{ config, lib, pkgs, ... }:

{

  imports = [ ./style.nix ];

  programs.waybar = {
    enable = true;

    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
    });

    settings = {
      bottom = {
        mode = "dock";
        layer = "bottom";
        height = 32;
        width = 100;
        margin = "6";
        position = "bottom";
        modules-center = (lib.optionals config.wayland.windowManager.sway.enable [
          "sway/workspaces"
          "sway/mode"
        ]) ++ (lib.optionals config.wayland.windowManager.hyprland.enable [
          "wlr/workspaces"
        ]);

        "wlr/workspaces" = {
          on-click = "activate";
        };
      };
      topBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 7;
        modules-left = (lib.optionals config.wayland.windowManager.sway.enable [
          "sway/mode"
        ]) ++ (lib.optionals config.wayland.windowManager.hyprland.enable [
          "wlr/taskbar"
        ]);
        modules-center = [ "clock" ];

        modules-right = [ "pulseaudio" "network" "memory" "backlight" "bluetooth" "temperature" "battery" ];

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

    };
  };
}
