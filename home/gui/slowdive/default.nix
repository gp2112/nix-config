{ config, pkgs, ... }:

{ imports = [ 
  ../common 
  ../common/desktops
  ../common/sway
];

  wayland.windowManager.sway.config = {
    input = {
        "*" = {
          xkb_layout = "us(intl)";
        };

        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          middle_emulation = "enabled";
        };

    };

    output = {
        "*" = {
          bg = "/home/gui/Pictures/swaybg.png fill";
        };
      };

  };

  programs.waybar.settings = {
    topBar = {
      output = ["eDP-1"];
      modules-right = [ "pulseaudio" "network" "backlight" "bluetooth" "temperature" "battery" ];
    };

    bottomBar = {

      output = [ "eDP-1" ];

    };

  };

   
}
